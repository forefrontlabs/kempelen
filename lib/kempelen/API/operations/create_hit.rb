module Kempelen
  module API
    module Operations
      class CreateHit < Base
        attr_accessor :hit_type_id
        attr_accessor :layout_id
        attr_accessor :layout_parameters
        attr_accessor :lifetime_in_seconds
        attr_accessor :max_assignments
        attr_accessor :requester_annotation
        attr_accessor :unique_request_token

        attr_accessor :reward_amount
        attr_accessor :currency_code
        attr_accessor :keywords
        attr_accessor :title
        attr_accessor :description
        attr_accessor :assignment_duration
        attr_accessor :auto_approval_delay

        attr_accessor :qualification_requirements

        AWS_OPERATION_NAME = "CreateHIT".freeze
        AWS_RESPONSE_OBJECT = "CreateHITResponse".freeze

        def initialize(client, hit_type_id, lifetime_in_seconds, &block)
          super(client)

          @hit_type_id = hit_type_id
          @lifetime_in_seconds = lifetime_in_seconds.to_i
          @layout_id = nil
          @requester_annotation = nil
          @unique_request_token = nil
          @layout_parameters = []
          @max_assignments = 1
          @response_object = AWS_RESPONSE_OBJECT

          @auto_approval_delay = 2592000
          @reward_amount = 0.0
          @currency_code = "USD".freeze

          @qualification_requirements = []

          yield self unless block == nil
        end

        def add_layout_parameter(name, value)
          @layout_parameters << {Name: name, Value: value}
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME

          if @hit_type_id.nil?
            @parameters[:assignment_duration] = @assignment_duration
            @parameters[:auto_approval_delay] = @auto_approval_delay
            @parameters[:title] = @title
            @parameters[:description] = @description
            @parameters[:keywords] = @keywords
            @parameters[:reward_amount] = [{Amount: @reward_amount, CurrencyCode: @currency_code}]
            @parameters[:qualification_requirements] = @qualification_requirements unless @qualification_requirements.empty?
          else
            @parameters[:hit_type_id] = @hit_type_id
          end
          @parameters[:lifetime_in_seconds] = @lifetime_in_seconds
          @parameters[:max_assignments] = @max_assignments
          @parameters[:layout_id] = @layout_id unless @layout_id.nil?
          @parameters[:layout_parameters] = @layout_parameters unless @layout_parameters.empty?
          @parameters[:requester_annotation] = @requester_annotation unless @requester_annotation.nil?
          @parameters[:unique_request_token] = @unique_request_token unless @unique_request_token.nil?

          super 
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::HitResponse.new(@raw_response)
        end
      end
    end
  end
end
