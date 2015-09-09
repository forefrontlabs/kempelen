module Kempelen
  module API
    module Responses
      class EmptyResponse < Base
        def initialize(response)
          super()

          load_from_response(response)
        end

        def load_from_response(response)
          super(response)
        end
      end
    end
  end
end
