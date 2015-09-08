module Kempelen
  module API
    module Operations
      class RejectAssignment < AssignmentOperation
        AWS_OPERATION_NAME = "RejectAssignment".freeze

        def initialize(client, assignment_id, requester_feedback = nil)
          super(client, assignment_id, requester_feedback)

          @operation_name = AWS_OPERATION_NAME
        end
      end
    end
  end
end
