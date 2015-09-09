module Kempelen
  module API
    module Responses
      class ErrorResponse
        attr_accessor :code
        attr_accessor :message
        attr_accessor :data

        def initialize(response = nil)
          @data = []

          parse_from_response(response) unless response.nil?
        end

        def parse_from_response(response)
          error = response["Error"]
          unless error.nil?
            @code = error["Code"]
            @message = error["Message"]
          end

          data = error["Data"].nil? ? [] : error["Data"]
          data.each do |data_value|
            key = data_value["Key"] rescue nil
            value = data_value["Value"] rescue nil
            @data << {key: key, value: value}
          end
        end
      end
    end
  end
end
