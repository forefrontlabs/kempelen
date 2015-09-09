module Kempelen
  module API
    module Responses
      class AccountBalanceResponse < Base
        attr_reader :available_balance
        attr_reader :on_hold_balance

        def initialize(response)
          super()

          load_from_response(response)
        end

        def load_from_response(response)
          super(response)

          balance_response = response["GetAccountBalanceResult"]
          unless balance_response.nil?
            @available_balance = Kempelen::API::Common::Price.create_from_response(balance_response["AvailableBalance"])
            @on_hold_balance = Kempelen::API::Common::Price.create_from_response(balance_response["OnHoldBalance"])
          end
        end

      end
    end
  end
end
