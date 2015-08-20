module Kempelen
  module API
    module Operations
      PARAMETERS = {
        service: "Service",
        operation: "Operation",
        access_key: "AWSAccessKeyId",
        timestamp: "Timestamp",
        signature: "Signature",
        hit_type_id: "HITTypeId",
        layout_id: "HITLayoutId",
        lifetime_in_seconds: "LifetimeInSeconds",
        max_assignments: "MaxAssignments",
        requester_annotation: "RequesterAnnotation",
        unique_request_token: "UniqueRequestToken",
        hit_id: "HITId"
      }

      ARRAY_PARAMETERS = {
        layout_parameters: "HITLayoutParameter"
      }
    end
  end
end
