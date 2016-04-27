require 'test_helper'

module Kempelen
  module API
    module Operations
      class NotifyWorkersTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::NotifyWorkers.new(@client, ["worker1", "worker2"], "SUBJECT LINE", "MESSAGE TEXT GOES HERE")
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "SUBJECT LINE", @operation.subject
          assert_equal "MESSAGE TEXT GOES HERE", @operation.message
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:subject])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:message_text])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation],
                       parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:subject],
                       parameters[Kempelen::API::Operations::PARAMETERS[:subject]].first
          assert_equal @operation.parameters[:message_text],
                       parameters[Kempelen::API::Operations::PARAMETERS[:message_text]].first
          assert_equal @operation.worker_ids.first, parameters["WorkerId.1"].first
          assert_equal @operation.worker_ids.last, parameters["WorkerId.2"].first
        end
      end
    end
  end
end
