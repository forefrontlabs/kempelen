require 'test_helper'

module Kempelen
  module API
    module Operations
      class RegisterHitTypeTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::RegisterHitType.new(@client, "TITLE", "DESCRIPTION", 1.0, 60)
        end

        def test_initialization
          assert_equal @client, @operation.client
          assert_equal "TITLE", @operation.title
          assert_equal "DESCRIPTION", @operation.description
          assert_empty @operation.keywords
          assert_equal 1.0, @operation.reward
          assert_equal 60, @operation.assignment_duration
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::RegisterHitType::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.title, @operation.parameters[:title]
          assert_equal @operation.description, @operation.parameters[:description]
          assert_equal @operation.reward, @operation.parameters[:reward]
          assert_equal @operation.assignment_duration, @operation.parameters[:assignment_duration]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:title])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:description])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:reward])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_duration])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal @operation.parameters[:operation],
                       parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:title],
                       parameters[Kempelen::API::Operations::PARAMETERS[:title]].first
          assert_equal @operation.parameters[:description].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:description]].first
          assert_equal @operation.parameters[:reward].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:reward]].first
          assert_equal @operation.parameters[:assignment_duration].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:assignment_duration]].first
        end

        def test_full_on_setup
          operation = Kempelen::API::Operations::RegisterHitType.new(@client, "TITLE", "DESCRIPTION", 1.0, 60) do |op|
            op.keywords << "Key"
            op.keywords << "Words"
            op.auto_approval_delay = 120
          end

          refute_empty operation.keywords
          assert_equal 120, operation.auto_approval_delay

          request_string = operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          assert_equal operation.parameters[:keywords],
                       parameters[Kempelen::API::Operations::PARAMETERS[:keywords]].first
          assert_equal operation.parameters[:auto_approval_delay].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:auto_approval_delay]].first
        end
      end
    end
  end
end
