require 'test_helper'

module Kempelen
  module API
    module Operations
      class CreateHitTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::CreateHit.new(@client, "HIT_TYPE_ID", 60)
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "HIT_TYPE_ID", @operation.hit_type_id
          assert_equal 60, @operation.lifetime_in_seconds
          assert_empty @operation.layout_parameters
          assert_equal 1, @operation.max_assignments
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::CreateHit::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.hit_type_id, @operation.parameters[:hit_type_id]
          assert_equal @operation.lifetime_in_seconds, @operation.parameters[:lifetime_in_seconds]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_type_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:lifetime_in_seconds])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:max_assignments])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation], 
            parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:hit_type_id], 
            parameters[Kempelen::API::Operations::PARAMETERS[:hit_type_id]].first
          assert_equal @operation.parameters[:lifetime_in_seconds].to_s, 
            parameters[Kempelen::API::Operations::PARAMETERS[:lifetime_in_seconds]].first
          assert_equal @operation.parameters[:max_assignments].to_s, 
            parameters[Kempelen::API::Operations::PARAMETERS[:max_assignments]].first
        end
      end
    end
  end
end
