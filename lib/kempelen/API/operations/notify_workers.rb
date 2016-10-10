module Kempelen
  module API
    module Operations
      class NotifyWorkers < Base
        attr_accessor :message
        attr_accessor :subject
        attr_accessor :worker_ids

        AWS_OPERATION_NAME = "NotifyWorkers".freeze
        AWS_RESPONSE_OBJECT = "NotifyWorkersResponse".freeze

        SUBJECT_MAX_LENGTH = 200
        MESSAGE_MAX_LENGTH = 4096
        WORKER_IDS_MAX_LENGTH = 100

        def initialize(client, worker_ids, subject, message)
          super(client)

          @operation_name = AWS_OPERATION_NAME
          @subject = subject.strip
          @message = message
          @worker_ids = worker_ids
        end

        def valid_arguments?
          @subject.length <= SUBJECT_MAX_LENGTH and 
            @subject.length > 0 and
            @message.length <= MESSAGE_MAX_LENGTH and 
            @message.length > 0 and
            @worker_ids.length <= WORKER_IDS_MAX_LENGTH and
            @worker_ids.length > 0
        end

        def create_parameters
          raise "Argument size restrictions violated" unless valid_arguments?

          @parameters[:subject] = @subject
          @parameters[:message_text] = @message
          @parameters[:worker_ids] = @worker_ids

          super 
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::EmptyResponse.new(@raw_response)
        end
      end
    end
  end
end
