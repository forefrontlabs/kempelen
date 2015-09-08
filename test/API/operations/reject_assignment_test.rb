require 'test_helper'

module Kempelen
  module API
    module Operations
      class RejectAssignmentTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::RejectAssignment.new(@client, "ASSIGNMENT_ID")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "ASSIGNMENT_ID", @operation.assignment_id
          assert_nil @operation.requester_feedback
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::RejectAssignment::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.assignment_id, @operation.parameters[:assignment_id]
          assert_equal @operation.requester_feedback, @operation.parameters[:requester_feedback]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          unless @operation.requester_feedback.nil?
            assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:requester_feedback])
          end
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation], 
            parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:assignment_id],
            parameters[Kempelen::API::Operations::PARAMETERS[:assignment_id]].first
          unless @operation.requester_feedback.nil?
            assert_equal @operation.parameters[:requester_feedback],
                         parameters[Kempelen::API::Operations::PARAMETERS[:requester_feedback]].first
          end
        end

        def test_create_request_string_will_create_required_parameters_with_feedback
          operation = Kempelen::API::Operations::RejectAssignment.new(@client, "ASSIGNMENT_ID", "REQUESTER_FEEDBACK")

          request_string = operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:requester_feedback])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
        end

        def test_create_request_string_produces_valid_url_with_feedback
          operation = Kempelen::API::Operations::RejectAssignment.new(@client, "ASSIGNMENT_ID", "REQUESTER_FEEDBACK")

          request_string = operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal operation.parameters[:operation],
                       parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal operation.parameters[:assignment_id],
                       parameters[Kempelen::API::Operations::PARAMETERS[:assignment_id]].first
          assert_equal operation.parameters[:requester_feedback],
                       parameters[Kempelen::API::Operations::PARAMETERS[:requester_feedback]].first
        end
      end
    end
  end
end
