module Aws
  module KMS
    module Errors
      class ServiceError < Exception
      end

      # The request was rejected because it attempted to create a resource that already exists.

      class AlreadyExistsException < ServiceError
      end

      # The request was rejected because the specified CloudHSM cluster is already associated with an
      # CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the
      # account. Each CloudHSM key store in the account must be associated with a different CloudHSM
      # cluster. CloudHSM clusters that share a backup history have the same cluster certificate. To view
      # the cluster certificate of an CloudHSM cluster, use the DescribeClusters operation.

      class CloudHsmClusterInUseException < ServiceError
      end

      # The request was rejected because the associated CloudHSM cluster did not meet the configuration
      # requirements for an CloudHSM key store. The CloudHSM cluster must be configured with private subnets
      # in at least two different Availability Zones in the Region. The security group for the cluster
      # (cloudhsm-cluster- &lt;cluster-id&gt; -sg) must include inbound rules and outbound rules that allow
      # TCP traffic on ports 2223-2225. The Source in the inbound rules and the Destination in the outbound
      # rules must match the security group ID. These rules are set by default when you create the CloudHSM
      # cluster. Do not delete or change them. To get information about a particular security group, use the
      # DescribeSecurityGroups operation. The CloudHSM cluster must contain at least as many HSMs as the
      # operation requires. To add HSMs, use the CloudHSM CreateHsm operation. For the CreateCustomKeyStore
      # , UpdateCustomKeyStore , and CreateKey operations, the CloudHSM cluster must have at least two
      # active HSMs, each in a different Availability Zone. For the ConnectCustomKeyStore operation, the
      # CloudHSM must contain at least one active HSM. For information about the requirements for an
      # CloudHSM cluster that is associated with an CloudHSM key store, see Assemble the Prerequisites in
      # the Key Management Service Developer Guide . For information about creating a private subnet for an
      # CloudHSM cluster, see Create a Private Subnet in the CloudHSM User Guide . For information about
      # cluster security groups, see Configure a Default Security Group in the CloudHSM User Guide .

      class CloudHsmClusterInvalidConfigurationException < ServiceError
      end

      # The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not
      # active. Initialize and activate the cluster and try the command again. For detailed instructions,
      # see Getting Started in the CloudHSM User Guide .

      class CloudHsmClusterNotActiveException < ServiceError
      end

      # The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID.
      # Retry the request with a different cluster ID.

      class CloudHsmClusterNotFoundException < ServiceError
      end

      # The request was rejected because the specified CloudHSM cluster has a different cluster certificate
      # than the original cluster. You cannot use the operation to specify an unrelated cluster for an
      # CloudHSM key store. Specify an CloudHSM cluster that shares a backup history with the original
      # cluster. This includes clusters that were created from a backup of the current cluster, and clusters
      # that were created from the same backup that produced the current cluster. CloudHSM clusters that
      # share a backup history have the same cluster certificate. To view the cluster certificate of an
      # CloudHSM cluster, use the DescribeClusters operation.

      class CloudHsmClusterNotRelatedException < ServiceError
      end

      # The request was rejected because an automatic rotation of this key is currently in progress or
      # scheduled to begin within the next 20 minutes.

      class ConflictException < ServiceError
      end

      # The request was rejected because the custom key store contains KMS keys. After verifying that you do
      # not need to use the KMS keys, use the ScheduleKeyDeletion operation to delete the KMS keys. After
      # they are deleted, you can delete the custom key store.

      class CustomKeyStoreHasCMKsException < ServiceError
      end

      # The request was rejected because of the ConnectionState of the custom key store. To get the
      # ConnectionState of a custom key store, use the DescribeCustomKeyStores operation. This exception is
      # thrown under the following conditions: You requested the ConnectCustomKeyStore operation on a custom
      # key store with a ConnectionState of DISCONNECTING or FAILED . This operation is valid for all other
      # ConnectionState values. To reconnect a custom key store in a FAILED state, disconnect it (
      # DisconnectCustomKeyStore ), then connect it ( ConnectCustomKeyStore ). You requested the CreateKey
      # operation in a custom key store that is not connected. This operations is valid only when the custom
      # key store ConnectionState is CONNECTED . You requested the DisconnectCustomKeyStore operation on a
      # custom key store with a ConnectionState of DISCONNECTING or DISCONNECTED . This operation is valid
      # for all other ConnectionState values. You requested the UpdateCustomKeyStore or DeleteCustomKeyStore
      # operation on a custom key store that is not disconnected. This operation is valid only when the
      # custom key store ConnectionState is DISCONNECTED . You requested the GenerateRandom operation in an
      # CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store
      # ConnectionState is CONNECTED .

      class CustomKeyStoreInvalidStateException < ServiceError
      end

      # The request was rejected because the specified custom key store name is already assigned to another
      # custom key store in the account. Try again with a custom key store name that is unique in the
      # account.

      class CustomKeyStoreNameInUseException < ServiceError
      end

      # The request was rejected because KMS cannot find a custom key store with the specified key store
      # name or ID.

      class CustomKeyStoreNotFoundException < ServiceError
      end

      # The system timed out while trying to fulfill the request. You can retry the request.

      class DependencyTimeoutException < ServiceError
      end

      # The request was rejected because the specified KMS key is not enabled.

      class DisabledException < ServiceError
      end

      # The request was rejected because the DryRun parameter was specified.

      class DryRunOperationException < ServiceError
      end

      # The request was rejected because the specified import token is expired. Use GetParametersForImport
      # to get a new import token and public key, use the new public key to encrypt the key material, and
      # then try the request again.

      class ExpiredImportTokenException < ServiceError
      end

      # The request was rejected because the specified KMS key cannot decrypt the data. The KeyId in a
      # Decrypt request and the SourceKeyId in a ReEncrypt request must identify the same KMS key that was
      # used to encrypt the ciphertext.

      class IncorrectKeyException < ServiceError
      end

      # The request was rejected because the key material in the request is, expired, invalid, or does not
      # meet expectations. For example, it is not the same key material that was previously imported or KMS
      # expected new key material but the key material being imported is already associated with the KMS
      # key.

      class IncorrectKeyMaterialException < ServiceError
      end

      # The request was rejected because the trust anchor certificate in the request to create an CloudHSM
      # key store is not the trust anchor certificate for the specified CloudHSM cluster. When you
      # initialize the CloudHSM cluster , you create the trust anchor certificate and save it in the
      # customerCA.crt file.

      class IncorrectTrustAnchorException < ServiceError
      end

      # The request was rejected because the specified alias name is not valid.

      class InvalidAliasNameException < ServiceError
      end

      # The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.

      class InvalidArnException < ServiceError
      end

      # From the Decrypt or ReEncrypt operation, the request was rejected because the specified ciphertext,
      # or additional authenticated data incorporated into the ciphertext, such as the encryption context,
      # is corrupted, missing, or otherwise invalid. From the ImportKeyMaterial operation, the request was
      # rejected because KMS could not decrypt the encrypted (wrapped) key material.

      class InvalidCiphertextException < ServiceError
      end

      # The request was rejected because the specified GrantId is not valid.

      class InvalidGrantIdException < ServiceError
      end

      # The request was rejected because the specified grant token is not valid.

      class InvalidGrantTokenException < ServiceError
      end

      # The request was rejected because the provided import token is invalid or is associated with a
      # different KMS key.

      class InvalidImportTokenException < ServiceError
      end

      # The request was rejected for one of the following reasons: The KeyUsage value of the KMS key is
      # incompatible with the API operation. The encryption algorithm or signing algorithm specified for the
      # operation is incompatible with the type of key material in the KMS key (KeySpec ). For encrypting,
      # decrypting, re-encrypting, and generating data keys, the KeyUsage must be ENCRYPT_DECRYPT . For
      # signing and verifying messages, the KeyUsage must be SIGN_VERIFY . For generating and verifying
      # message authentication codes (MACs), the KeyUsage must be GENERATE_VERIFY_MAC . For deriving key
      # agreement secrets, the KeyUsage must be KEY_AGREEMENT . To find the KeyUsage of a KMS key, use the
      # DescribeKey operation. To find the encryption or signing algorithms supported for a particular KMS
      # key, use the DescribeKey operation.

      class InvalidKeyUsageException < ServiceError
      end

      # The request was rejected because the marker that specifies where pagination should next begin is not
      # valid.

      class InvalidMarkerException < ServiceError
      end

      # The request was rejected because an internal exception occurred. The request can be retried.

      class KMSInternalException < ServiceError
      end

      # The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC
      # computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC
      # specified in the request.

      class KMSInvalidMacException < ServiceError
      end

      # The request was rejected because the signature verification failed. Signature verification fails
      # when it cannot confirm that signature was produced by signing the specified message with the
      # specified KMS key and signing algorithm.

      class KMSInvalidSignatureException < ServiceError
      end

      # The request was rejected because the state of the specified resource is not valid for this request.
      # This exceptions means one of the following: The key state of the KMS key is not compatible with the
      # operation. To find the key state, use the DescribeKey operation. For more information about which
      # key states are compatible with each KMS operation, see Key states of KMS keys in the Key Management
      # Service Developer Guide . For cryptographic operations on KMS keys in custom key stores, this
      # exception represents a general failure with many possible causes. To identify the cause, see the
      # error message that accompanies the exception.

      class KMSInvalidStateException < ServiceError
      end

      # The request was rejected because the specified KMS key was not available. You can retry the request.

      class KeyUnavailableException < ServiceError
      end

      # The request was rejected because a length constraint or quota was exceeded. For more information,
      # see Quotas in the Key Management Service Developer Guide .

      class LimitExceededException < ServiceError
      end

      # The request was rejected because the specified policy is not syntactically or semantically correct.

      class MalformedPolicyDocumentException < ServiceError
      end

      # The request was rejected because the specified entity or resource could not be found.

      class NotFoundException < ServiceError
      end

      # The request was rejected because one or more tags are not valid.

      class TagException < ServiceError
      end

      # The request was rejected because a specified parameter is not supported or a specified resource is
      # not valid for this operation.

      class UnsupportedOperationException < ServiceError
      end

      # The request was rejected because the ( XksKeyId ) is already associated with another KMS key in this
      # external key store. Each KMS key in an external key store must be associated with a different
      # external key.

      class XksKeyAlreadyInUseException < ServiceError
      end

      # The request was rejected because the external key specified by the XksKeyId parameter did not meet
      # the configuration requirements for an external key store. The external key must be an AES-256
      # symmetric key that is enabled and performs encryption and decryption.

      class XksKeyInvalidConfigurationException < ServiceError
      end

      # The request was rejected because the external key store proxy could not find the external key. This
      # exception is thrown when the value of the XksKeyId parameter doesn't identify a key in the external
      # key manager associated with the external key proxy. Verify that the XksKeyId represents an existing
      # key in the external key manager. Use the key identifier that the external key store proxy uses to
      # identify the key. For details, see the documentation provided with your external key store proxy or
      # key manager.

      class XksKeyNotFoundException < ServiceError
      end

      # The request was rejected because the proxy credentials failed to authenticate to the specified
      # external key store proxy. The specified external key store proxy rejected a status request from KMS
      # due to invalid credentials. This can indicate an error in the credentials or in the identification
      # of the external key store proxy.

      class XksProxyIncorrectAuthenticationCredentialException < ServiceError
      end

      # The request was rejected because the external key store proxy is not configured correctly. To
      # identify the cause, see the error message that accompanies the exception.

      class XksProxyInvalidConfigurationException < ServiceError
      end

      # KMS cannot interpret the response it received from the external key store proxy. The problem might
      # be a poorly constructed response, but it could also be a transient network issue. If you see this
      # error repeatedly, report it to the proxy vendor.

      class XksProxyInvalidResponseException < ServiceError
      end

      # The request was rejected because the XksProxyUriEndpoint is already associated with another external
      # key store in this Amazon Web Services Region. To identify the cause, see the error message that
      # accompanies the exception.

      class XksProxyUriEndpointInUseException < ServiceError
      end

      # The request was rejected because the concatenation of the XksProxyUriEndpoint and XksProxyUriPath is
      # already associated with another external key store in this Amazon Web Services Region. Each external
      # key store in a Region must use a unique external key store proxy API address.

      class XksProxyUriInUseException < ServiceError
      end

      # KMS was unable to reach the specified XksProxyUriPath . The path must be reachable before you create
      # the external key store or update its settings. This exception is also thrown when the external key
      # store proxy response to a GetHealthStatus request indicates that all external key manager instances
      # are unavailable.

      class XksProxyUriUnreachableException < ServiceError
      end

      # The request was rejected because the specified Amazon VPC endpoint service is already associated
      # with another external key store in this Amazon Web Services Region. Each external key store in a
      # Region must use a different Amazon VPC endpoint service.

      class XksProxyVpcEndpointServiceInUseException < ServiceError
      end

      # The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the
      # requirements for an external key store. To identify the cause, see the error message that
      # accompanies the exception and review the requirements for Amazon VPC endpoint service connectivity
      # for an external key store.

      class XksProxyVpcEndpointServiceInvalidConfigurationException < ServiceError
      end

      # The request was rejected because KMS could not find the specified VPC endpoint service. Use
      # DescribeCustomKeyStores to verify the VPC endpoint service name for the external key store. Also,
      # confirm that the Allow principals list for the VPC endpoint service includes the KMS service
      # principal for the Region, such as cks.kms.us-east-1.amazonaws.com .

      class XksProxyVpcEndpointServiceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "CloudHsmClusterInUseException"
          CloudHsmClusterInUseException.new(message)
        when "CloudHsmClusterInvalidConfigurationException"
          CloudHsmClusterInvalidConfigurationException.new(message)
        when "CloudHsmClusterNotActiveException"
          CloudHsmClusterNotActiveException.new(message)
        when "CloudHsmClusterNotFoundException"
          CloudHsmClusterNotFoundException.new(message)
        when "CloudHsmClusterNotRelatedException"
          CloudHsmClusterNotRelatedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "CustomKeyStoreHasCMKsException"
          CustomKeyStoreHasCMKsException.new(message)
        when "CustomKeyStoreInvalidStateException"
          CustomKeyStoreInvalidStateException.new(message)
        when "CustomKeyStoreNameInUseException"
          CustomKeyStoreNameInUseException.new(message)
        when "CustomKeyStoreNotFoundException"
          CustomKeyStoreNotFoundException.new(message)
        when "DependencyTimeoutException"
          DependencyTimeoutException.new(message)
        when "DisabledException"
          DisabledException.new(message)
        when "DryRunOperationException"
          DryRunOperationException.new(message)
        when "ExpiredImportTokenException"
          ExpiredImportTokenException.new(message)
        when "IncorrectKeyException"
          IncorrectKeyException.new(message)
        when "IncorrectKeyMaterialException"
          IncorrectKeyMaterialException.new(message)
        when "IncorrectTrustAnchorException"
          IncorrectTrustAnchorException.new(message)
        when "InvalidAliasNameException"
          InvalidAliasNameException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidCiphertextException"
          InvalidCiphertextException.new(message)
        when "InvalidGrantIdException"
          InvalidGrantIdException.new(message)
        when "InvalidGrantTokenException"
          InvalidGrantTokenException.new(message)
        when "InvalidImportTokenException"
          InvalidImportTokenException.new(message)
        when "InvalidKeyUsageException"
          InvalidKeyUsageException.new(message)
        when "InvalidMarkerException"
          InvalidMarkerException.new(message)
        when "KMSInternalException"
          KMSInternalException.new(message)
        when "KMSInvalidMacException"
          KMSInvalidMacException.new(message)
        when "KMSInvalidSignatureException"
          KMSInvalidSignatureException.new(message)
        when "KMSInvalidStateException"
          KMSInvalidStateException.new(message)
        when "KeyUnavailableException"
          KeyUnavailableException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TagException"
          TagException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "XksKeyAlreadyInUseException"
          XksKeyAlreadyInUseException.new(message)
        when "XksKeyInvalidConfigurationException"
          XksKeyInvalidConfigurationException.new(message)
        when "XksKeyNotFoundException"
          XksKeyNotFoundException.new(message)
        when "XksProxyIncorrectAuthenticationCredentialException"
          XksProxyIncorrectAuthenticationCredentialException.new(message)
        when "XksProxyInvalidConfigurationException"
          XksProxyInvalidConfigurationException.new(message)
        when "XksProxyInvalidResponseException"
          XksProxyInvalidResponseException.new(message)
        when "XksProxyUriEndpointInUseException"
          XksProxyUriEndpointInUseException.new(message)
        when "XksProxyUriInUseException"
          XksProxyUriInUseException.new(message)
        when "XksProxyUriUnreachableException"
          XksProxyUriUnreachableException.new(message)
        when "XksProxyVpcEndpointServiceInUseException"
          XksProxyVpcEndpointServiceInUseException.new(message)
        when "XksProxyVpcEndpointServiceInvalidConfigurationException"
          XksProxyVpcEndpointServiceInvalidConfigurationException.new(message)
        when "XksProxyVpcEndpointServiceNotFoundException"
          XksProxyVpcEndpointServiceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
