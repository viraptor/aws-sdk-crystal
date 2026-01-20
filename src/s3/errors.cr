module Aws
  module S3
    module Errors
      class ServiceError < Exception
      end

      # The requested bucket name is not available. The bucket namespace is shared by all users of the
      # system. Select a different name and try again.

      class BucketAlreadyExists < ServiceError
      end

      # The bucket you tried to create already exists, and you own it. Amazon S3 returns this error in all
      # Amazon Web Services Regions except in the North Virginia Region. For legacy compatibility, if you
      # re-create an existing bucket that you already own in the North Virginia Region, Amazon S3 returns
      # 200 OK and resets the bucket access control lists (ACLs).

      class BucketAlreadyOwnedByYou < ServiceError
      end

      # The existing object was created with a different encryption type. Subsequent write requests must
      # include the appropriate encryption parameters in the request or while creating the session.

      class EncryptionTypeMismatch < ServiceError
      end

      # Parameters on this idempotent request are inconsistent with parameters used in previous request(s).
      # For a list of error codes and more information on Amazon S3 errors, see Error codes . Idempotency
      # ensures that an API request completes no more than one time. With an idempotent request, if the
      # original request completes successfully, any subsequent retries complete successfully without
      # performing any further actions.

      class IdempotencyParameterMismatch < ServiceError
      end

      # Object is archived and inaccessible until restored. If the object you are retrieving is stored in
      # the S3 Glacier Flexible Retrieval storage class, the S3 Glacier Deep Archive storage class, the S3
      # Intelligent-Tiering Archive Access tier, or the S3 Intelligent-Tiering Deep Archive Access tier,
      # before you can retrieve the object you must first restore a copy using RestoreObject . Otherwise,
      # this operation returns an InvalidObjectState error. For information about restoring archived
      # objects, see Restoring Archived Objects in the Amazon S3 User Guide .

      class InvalidObjectState < ServiceError
      end

      # You may receive this error in multiple cases. Depending on the reason for the error, you may receive
      # one of the messages below: Cannot specify both a write offset value and user-defined object metadata
      # for existing objects. Checksum Type mismatch occurred, expected checksum Type: sha1, actual checksum
      # Type: crc32c. Request body cannot be empty when 'write offset' is specified.

      class InvalidRequest < ServiceError
      end

      # The write offset value that you specified does not match the current object size.

      class InvalidWriteOffset < ServiceError
      end

      # The specified bucket does not exist.

      class NoSuchBucket < ServiceError
      end

      # The specified key does not exist.

      class NoSuchKey < ServiceError
      end

      # The specified multipart upload does not exist.

      class NoSuchUpload < ServiceError
      end

      # This action is not allowed against this storage tier.

      class ObjectAlreadyInActiveTierError < ServiceError
      end

      # The source object of the COPY action is not in the active tier and is only stored in Amazon S3
      # Glacier.

      class ObjectNotInActiveTierError < ServiceError
      end

      # You have attempted to add more parts than the maximum of 10000 that are allowed for this object. You
      # can use the CopyObject operation to copy this object to another and then add more data to the newly
      # copied object.

      class TooManyParts < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BucketAlreadyExists"
          BucketAlreadyExists.new(message)
        when "BucketAlreadyOwnedByYou"
          BucketAlreadyOwnedByYou.new(message)
        when "EncryptionTypeMismatch"
          EncryptionTypeMismatch.new(message)
        when "IdempotencyParameterMismatch"
          IdempotencyParameterMismatch.new(message)
        when "InvalidObjectState"
          InvalidObjectState.new(message)
        when "InvalidRequest"
          InvalidRequest.new(message)
        when "InvalidWriteOffset"
          InvalidWriteOffset.new(message)
        when "NoSuchBucket"
          NoSuchBucket.new(message)
        when "NoSuchKey"
          NoSuchKey.new(message)
        when "NoSuchUpload"
          NoSuchUpload.new(message)
        when "ObjectAlreadyInActiveTierError"
          ObjectAlreadyInActiveTierError.new(message)
        when "ObjectNotInActiveTierError"
          ObjectNotInActiveTierError.new(message)
        when "TooManyParts"
          TooManyParts.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
