module Kempelen
  module API
    module Responses
      # noinspection RubyTooManyInstanceVariablesInspection
      class HitResponse < Base
        attr_reader :hit_id
        attr_reader :hit_type_id
        attr_reader :hit_group_id
        attr_reader :hit_layout_id
        attr_reader :creation_time
        attr_reader :expiration
        attr_reader :hit_status
        attr_reader :max_assignments
        attr_reader :assignments_pending
        attr_reader :assignments_available
        attr_reader :assignments_completed
        attr_reader :similar_hits
        attr_reader :auto_approval_delay
        attr_reader :lifetime
        attr_reader :reward
        attr_reader :title
        attr_reader :description
        attr_reader :keywords
        attr_reader :question
        attr_reader :requester_annotation
        attr_reader :review_status
        attr_reader :qualification_requirement

        def initialize(response)
          super()

          load_from_response(response)
        end

        def load_from_response(response)
          super(response)

          hit_response = response["HIT"]
          unless hit_response.nil?
            @hit_id = hit_response["HITId"]
            @hit_type_id = hit_response["HITTypeId"]
            @hit_group_id = hit_response["HITGroupId"]
            @hit_layout_id = hit_response["HITLayoutId"]
            @creation_time = DateTime.parse(hit_response["CreationTime"]) rescue nil
            @expiration = DateTime.parse(hit_response["Expiration"]) rescue nil
            @hit_status = hit_response["HITStatus"]
            @max_assignments = hit_response["MaxAssignments"].to_i
            @assignments_pending = hit_response["NumberofAssignmentsPending"].to_i
            @assignments_available = hit_response["NumberofAssignmentsAvailable"].to_i
            @assignments_completed = hit_response["NumberofAssignmentsCompleted"].to_i
            @similar_hits = hit_response["NumberOfSimilarHITs"].to_i
            @auto_approval_delay = hit_response["AutoApprovalDelayInSeconds"].to_i
            @lifetime = hit_response["LifetimeInSeconds"].to_i
            @title = hit_response["Title"]
            @description = hit_response["Description"]
            @keywords = hit_response["Keywords"]
            @question = hit_response["Question"]
            @review_status = hit_response["HITReviewStatus"]
            @requester_annotation = hit_response["RequesterAnnotation"]
          end
        end

      end
    end
  end
end
