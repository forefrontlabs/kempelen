require 'test_helper'

module Kempelen
  module API
    module Operations
      class ForceExpireHitTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::ForceExpireHit.new(@client, "HIT_ID")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "HIT_ID", @operation.hit_id
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::ForceExpireHit::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.hit_id, @operation.parameters[:hit_id]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation], 
            parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:hit_id], 
            parameters[Kempelen::API::Operations::PARAMETERS[:hit_id]].first
        end
      end
    end
  end
end
