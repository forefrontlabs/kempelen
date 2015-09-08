require 'test_helper'

module Kempelen
  module API
    module Operations
      class GetReviewableHitsTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::GetReviewableHits.new(@client, "HIT_TYPE_ID")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "HIT_TYPE_ID", @operation.hit_type_id
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::GetReviewableHits::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.hit_type_id, @operation.parameters[:hit_type_id]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_type_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:status])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_size])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_number])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:sort_property])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:sort_direction])
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
          assert_equal @operation.parameters[:status],
                       parameters[Kempelen::API::Operations::PARAMETERS[:status]].first
          assert_equal @operation.parameters[:page_size],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_size]].first.to_i
          assert_equal @operation.parameters[:page_number],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_number]].first.to_i
          assert_equal @operation.parameters[:sort_property],
                       parameters[Kempelen::API::Operations::PARAMETERS[:sort_property]].first
          assert_equal @operation.parameters[:sort_direction],
                       parameters[Kempelen::API::Operations::PARAMETERS[:sort_direction]].first
        end
      end
    end
  end
end
