module Kempelen
  module API
    module Operations
      class ForceExpireHit < Base
        attr_accessor :hit_id

        AWS_OPERATION_NAME = "ForceExpireHIT"

        def initialize(client, hit_id)
          super(client)

          @hit_id = hit_id
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:hit_id] = @hit_id

          super 
        end
      end
    end
  end
end