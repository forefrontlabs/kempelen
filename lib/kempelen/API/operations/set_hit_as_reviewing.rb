module Kempelen
  module API
    module Operations
      class SetHitAsReviewing < HitOperation
        attr_accessor :revert

        AWS_OPERATION_NAME = "SetHITAsReviewing".freeze

        def initialize(client, hit_id, revert = false)
          super(client, hit_id)

          @operation_name = AWS_OPERATION_NAME
          @revert = revert
        end

        def create_parameters
          @parameters[:revert] = @revert

          super 
        end
      end
    end
  end
end
