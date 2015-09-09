module Kempelen
  module API
    module Responses
      class Base
        attr_accessor :success
        attr_accessor :request_id
        attr_accessor :error

        def initialize
          @success = false
          @error = nil
        end

        def load_from_response(response)
          @request_id = response["OperationRequest"]["RequestId"] rescue nil

          response.each_key do |k|
            if response[k].has_key?("Request")
              request_response = response[k]["Request"]
              @success = (request_response["IsValid"] == "True")

              if request_response.has_key?("Errors")
                @success = false
                @error = ErrorResponse.new(request_response["Errors"])
              end
            end
          end
        end
      end
    end
  end
end
