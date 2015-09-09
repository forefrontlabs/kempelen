module Kempelen
  module API
    module Operations
      class ApproveAssignment < AssignmentOperation
        AWS_OPERATION_NAME = "ApproveAssignment".freeze
        AWS_RESPONSE_OBJECT = "ApproveAssignmentResponse".freeze

        def initialize(client, assignment_id, requester_feedback = nil)
          super(client, assignment_id, requester_feedback)

          @operation_name = AWS_OPERATION_NAME
          @response_object = AWS_RESPONSE_OBJECT
        end
      end
    end
  end
end
