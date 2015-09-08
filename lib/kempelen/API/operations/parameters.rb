module Kempelen
  module API
    module Operations
      PARAMETERS = {
        service: "Service".freeze,
        operation: "Operation".freeze,
        access_key: "AWSAccessKeyId".freeze,
        timestamp: "Timestamp".freeze,
        signature: "Signature".freeze,
        hit_type_id: "HITTypeId".freeze,
        layout_id: "HITLayoutId".freeze,
        lifetime_in_seconds: "LifetimeInSeconds".freeze,
        max_assignments: "MaxAssignments".freeze,
        requester_annotation: "RequesterAnnotation".freeze,
        unique_request_token: "UniqueRequestToken".freeze,
        hit_id: "HITId".freeze,
        status: "Status".freeze,
        page_size: "PageSize".freeze,
        page_number: "PageNumber".freeze,
        sort_property: "SortProperty".freeze,
        sort_direction: "SortDirection".freeze,
        assignment_id: "AssigmentId".freeze,
        requester_feedback: "RequesterFeedback".freeze
      }

      ARRAY_PARAMETERS = {
        layout_parameters: "HITLayoutParameter".freeze
      }
    end
  end
end
