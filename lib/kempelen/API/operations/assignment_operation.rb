module Kempelen
  module API
    module Operations
      class AssignmentOperation < Base
        attr_accessor :assignment_id
        attr_accessor :requester_feedback
        attr_accessor :operation_name

        FEEDBACK_MAX_SIZE = 1024

        def initialize(client, assignment_id, requester_feedback = nil)
          super(client)

          @assignment_id = assignment_id
          @requester_feedback = requester_feedback
        end

        def create_parameters
          @parameters[:operation] = @operation_name
          @parameters[:assignment_id] = @assignment_id
          @parameters[:requester_feedback] = @requester_feedback.slice(0, FEEDBACK_MAX_SIZE) unless @requester_feedback.nil?

          super
        end
      end
    end
  end
end
