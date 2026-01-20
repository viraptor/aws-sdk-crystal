require "./spec_helper"

describe Aws::Route53::Protocol::RestXml do
  it "builds ChangeResourceRecordSets with uri labels and xml body" do
    record_set = Aws::Route53::Types::ResourceRecordSet.new("example.com.", "A")
    change = Aws::Route53::Types::Change.new("CREATE", record_set)
    change_batch = Aws::Route53::Types::ChangeBatch.new([change])
    input = Aws::Route53::Types::ChangeResourceRecordSetsRequest.new(change_batch, "Z123456789")

    request = Aws::Route53::Protocol::RestXml.build_request(
      Aws::Route53::Model::CHANGE_RESOURCE_RECORD_SETS,
      input,
      "https://route53.amazonaws.com"
    )

    request.method.should eq("POST")
    request.uri.should contain("/2013-04-01/hostedzone/Z123456789/rrset/")
    request.headers["content-type"].should eq("application/xml")
    request.body.should_not be_nil
    request.body.not_nil!.should contain("ChangeResourceRecordSetsRequest")
    request.body.not_nil!.should contain("xmlns=\"https://route53.amazonaws.com/doc/2013-04-01/\"")
    request.body.not_nil!.should contain("<ChangeBatch>")
    request.body.not_nil!.should contain("<Changes>")
    request.body.not_nil!.should contain("<Change>")
  end

  it "builds GetGeoLocation with query params and no body" do
    input = Aws::Route53::Types::GetGeoLocationRequest.new("EU", "FR", "IDF")

    request = Aws::Route53::Protocol::RestXml.build_request(
      Aws::Route53::Model::GET_GEO_LOCATION,
      input,
      "https://route53.amazonaws.com"
    )

    request.method.should eq("GET")
    request.uri.should contain("/2013-04-01/geolocation")
    request.uri.should contain("continentcode=EU")
    request.uri.should contain("countrycode=FR")
    request.uri.should contain("subdivisioncode=IDF")
    request.body.should be_nil
  end

  it "parses body and headers in responses" do
    response = Aws::Runtime::Http::Response.new(
      201,
      {"Location" => "/2013-04-01/cidrcollection/abc"} of String => String,
      <<-XML
      <CreateCidrCollectionResponse xmlns="https://route53.amazonaws.com/doc/2013-04-01/">
        <Collection></Collection>
      </CreateCidrCollectionResponse>
      XML
    )

    output = Aws::Route53::Protocol::RestXml.parse_response(
      response,
      Aws::Route53::Types::CreateCidrCollectionResponse,
      "CreateCidrCollection"
    )

    output.location.should eq("/2013-04-01/cidrcollection/abc")
    output.collection.should_not be_nil
  end

  it "parses error responses from body" do
    response = Aws::Runtime::Http::Response.new(
      400,
      {} of String => String,
      <<-XML
      <ErrorResponse>
        <Error>
          <Code>InvalidInput</Code>
          <Message>bad input</Message>
        </Error>
      </ErrorResponse>
      XML
    )

    error = Aws::Route53::Protocol::RestXml.parse_error(response)
    error.should be_a(Aws::Route53::Errors::InvalidInput)
    error.message.should eq("bad input")
  end
end
