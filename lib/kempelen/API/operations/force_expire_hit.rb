module Kempelen
  module API
    module Operations
      class ForceExpireHit < HitOperation
        AWS_OPERATION_NAME = "ForceExpireHIT".freeze

        def initialize(client, hit_id)
          super(client, hit_id)

          @operation_name = AWS_OPERATION_NAME
        end
      end
    end
  end
end
