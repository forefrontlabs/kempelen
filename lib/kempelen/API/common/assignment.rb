module Kempelen
  module API
    module Common
      class Assignment
        attr_accessor :assignment_id
        attr_accessor :worker_id
        attr_accessor :hit_id
        attr_accessor :status
        attr_accessor :auto_approval_time
        attr_accessor :accept_time
        attr_accessor :submit_time
        attr_accessor :answer

        def self.create_from_response(response)
          return nil if response.nil?

          assignment = Assignment.new

          assignment.assignment_id = response["AssignmentId"]
          assignment.worker_id = response["WorkerId"]
          assignment.hit_id = response["HITId"]
          assignment.status = response["AssignmentStatus"]
          assignment.auto_approval_time = DateTime.parse(response["AutoApprovalTime"]) rescue nil
          assignment.accept_time = DateTime.parse(response["AcceptTime"]) rescue nil
          assignment.submit_time = DateTime.parse(response["SubmitTime"]) rescue nil
          assignment.answer = response["Answer"]

          assignment
        end

      end
    end
  end
end
