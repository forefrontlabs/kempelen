module Kempelen
  module API
    module Operations
      class HitOperation < Base
        attr_accessor :hit_id
        attr_accessor :operation_name

        def initialize(client, hit_id)
          super(client)

          @hit_id = hit_id
        end

        def create_parameters
          @parameters[:operation] = @operation_name
          @parameters[:hit_id] = @hit_id

          super
        end
      end
    end
  end
end
