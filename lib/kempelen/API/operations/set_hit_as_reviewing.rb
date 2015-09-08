module Kempelen
  module API
    module Operations
      class SetHitAsReviewing < Base
        attr_accessor :hit_id
        attr_accessor :revert

        AWS_OPERATION_NAME = "SetHITAsReviewing".freeze

        def initialize(client, hit_id, revert = false)
          super(client)

          @hit_id = hit_id
          @revert = revert
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:hit_id] = @hit_id
          @parameters[:revert] = @revert

          super 
        end
      end
    end
  end
end
