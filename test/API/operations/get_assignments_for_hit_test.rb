require 'test_helper'

module Kempelen
  module API
    module Operations
      class GetAssignmentsForHitTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::GetAssignmentsForHit.new(@client, "HIT_ID")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "HIT_ID", @operation.hit_id
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::GetAssignmentsForHit::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.hit_id, @operation.parameters[:hit_id]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_id])
          unless @operation.assignment_status.nil?
            assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_status])
          end
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_size])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_number])
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
          unless @operation.assignment_status.nil?
            assert_equal @operation.parameters[:assignment_status],
                         parameters[Kempelen::API::Operations::PARAMETERS[:assignment_status]].first
          end
          assert_equal @operation.parameters[:page_size],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_size]].first.to_i
          assert_equal @operation.parameters[:page_number],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_number]].first.to_i
        end

        def test_create_request_string_will_create_required_parameters_with_status
          @operation.assignment_status = 'Submitted'
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_status])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_size])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:page_number])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url_with_status
          @operation.assignment_status = 'Submitted'
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation],
                       parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:hit_id],
                       parameters[Kempelen::API::Operations::PARAMETERS[:hit_id]].first
          assert_equal @operation.parameters[:assignment_status],
                       parameters[Kempelen::API::Operations::PARAMETERS[:assignment_status]].first
          assert_equal @operation.parameters[:page_size],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_size]].first.to_i
          assert_equal @operation.parameters[:page_number],
                       parameters[Kempelen::API::Operations::PARAMETERS[:page_number]].first.to_i
        end
      end
    end
  end
end
