module Kempelen
  module API
    module Common
      class Price
        attr_accessor :amount
        attr_accessor :currency_code

        def initialize(amount = 0.0, currency_code = "USD")
          @amount = amount
          @currency_code = currency_code
        end

        def self.create_from_response(response)
          return nil if response.nil?

          price = Price.new

          price.amount = response["Amount"].to_f
          price.currency_code = response["CurrencyCode"]

          price
        end
      end
    end
  end
end
