require 'test_helper'

module Kempelen
  module API
    module Operations
      class GetAccountBalanceTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::GetAccountBalance.new(@client)
        end

        def test_initialization
          assert_equal @client, @operation.client
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::GetAccountBalance::AWS_OPERATION_NAME, @operation.parameters[:operation]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:hit_id],
            parameters[Kempelen::API::Operations::PARAMETERS[:hit_id]].first
        end
      end
    end
  end
end
