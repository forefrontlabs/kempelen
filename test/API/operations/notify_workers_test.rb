require 'test_helper'

module Kempelen
  module API
    module Operations
      class NotifyWorkersTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::NotifyWorkers.new(@client, ["worker1", "worker2"], "SUBJECT", "MESSAGE")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "SUBJECT", @operation.subject
          assert_equal "MESSAGE", @operation.message
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:subject])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:message_text])
        end
      end
    end
  end
end
