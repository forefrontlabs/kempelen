module Kempelen
  module API
    module Operations
      class RejectAssignment < Base
        attr_accessor :assignment_id
        attr_accessor :requester_feedback

        AWS_OPERATION_NAME = "RejectAssignment".freeze

        def initialize(client, assignment_id, requester_feedback = nil)
          super(client)

          @assignment_id = assignment_id
          @requester_feedback = requester_feedback
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:assignment_id] = @assignment_id
          @parameters[:requester_feedback] = @requester_feedback.slice(0, 1024) unless @requester_feedback.nil?

          super 
        end
      end
    end
  end
end
