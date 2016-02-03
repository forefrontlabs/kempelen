require 'test_helper'

module Kempelen
  module API
    module Operations
      class CreateHitNoHitTypeTest < Minitest::Test
        def setup
          @client = Kempelen::API::Client.new("A", "B", :sandbox)
          @operation = Kempelen::API::Operations::CreateHit.new(@client, nil, 60) do |op|
            op.reward_amount = 0.60
            op.keywords = "KEYWORDS"
            op.title = "TITLE"
            op.description = "DESCRIPTION"
            op.assignment_duration = 45
            op.auto_approval_delay = 24 * 3600
            op.qualification_requirements << {QualificationTypeId: "QUALIFICATION_TYPE_ID", Comparator: "COMPARATOR"}
          end
        end

        def test_initialization
          operation = Kempelen::API::Operations::CreateHit.new(@client, nil, 60)
          assert_equal @client, operation.client
          assert_nil operation.hit_type_id
          assert_equal 60, operation.lifetime_in_seconds
          assert_equal 0.0, operation.reward_amount
          assert_equal "USD", operation.currency_code
          assert_empty operation.layout_parameters
          assert_empty operation.qualification_requirements
          assert_equal 1, operation.max_assignments
        end

        def test_create_parameters
          @operation.create_parameters

          assert_equal Kempelen::API::Operations::CreateHit::AWS_OPERATION_NAME, @operation.parameters[:operation]
          assert_equal @operation.keywords, @operation.parameters[:keywords]
          assert_equal @operation.title, @operation.parameters[:title]
          assert_equal @operation.description, @operation.parameters[:description]
          assert_equal @operation.lifetime_in_seconds, @operation.parameters[:lifetime_in_seconds]
          assert_equal @operation.assignment_duration, @operation.parameters[:assignment_duration]
          assert_equal @operation.auto_approval_delay, @operation.parameters[:auto_approval_delay]
          assert_equal @operation.qualification_requirements.first, @operation.parameters[:qualification_requirements].first
          assert_nil @operation.parameters[:hit_type_id]
        end

        def test_create_request_string_will_create_required_parameters
          request_string = @operation.create_request_string

          refute request_string.include?(Kempelen::API::Operations::PARAMETERS[:hit_type_id])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:lifetime_in_seconds])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:max_assignments])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:operation])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:keywords])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:title])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:description])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:assignment_duration])
          assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:auto_approval_delay])
          assert request_string.include?(Kempelen::API::Operations::ARRAY_PARAMETERS[:qualification_requirements])
          assert request_string.include?(Kempelen::API::Operations::ARRAY_PARAMETERS[:reward_amount])
        end

        def test_create_request_string_produces_valid_url
          request_string = @operation.create_request_string
          request_uri = URI(request_string)
          parameters = CGI::parse(request_uri.query)

          puts request_string

          assert_empty parameters[Kempelen::API::Operations::PARAMETERS[:hit_type_id]]
          assert_equal @operation.parameters[:operation],
                       parameters[Kempelen::API::Operations::PARAMETERS[:operation]].first
          assert_equal @operation.parameters[:lifetime_in_seconds].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:lifetime_in_seconds]].first
          assert_equal @operation.parameters[:max_assignments].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:max_assignments]].first
          assert_equal @operation.parameters[:keywords],
                       parameters[Kempelen::API::Operations::PARAMETERS[:keywords]].first
          assert_equal @operation.parameters[:title],
                       parameters[Kempelen::API::Operations::PARAMETERS[:title]].first
          assert_equal @operation.parameters[:description],
                       parameters[Kempelen::API::Operations::PARAMETERS[:description]].first
          assert_equal @operation.parameters[:assignment_duration].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:assignment_duration]].first
          assert_equal @operation.parameters[:auto_approval_delay].to_s,
                       parameters[Kempelen::API::Operations::PARAMETERS[:auto_approval_delay]].first
          assert_equal @operation.qualification_requirements.first[:QualificationTypeId],
                       parameters["QualificationRequirement.1.QualificationTypeId"].first
          assert_equal @operation.qualification_requirements.first[:Comparator],
                       parameters["QualificationRequirement.1.Comparator"].first
          assert_equal @operation.reward_amount.to_s,
                       parameters["Reward.1.Amount"].first
          assert_equal @operation.currency_code,
                       parameters["Reward.1.CurrencyCode"].first
        end
      end
    end
  end
end
