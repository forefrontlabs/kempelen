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

        AWS_OPERATION_NAME = "CreateHIT".freeze

        def initialize(client, hit_type_id, lifetime_in_seconds, &block)
          super(client)

          @hit_type_id = hit_type_id
          @lifetime_in_seconds = lifetime_in_seconds.to_i
          @layout_parameters = []
          @max_assignments = 1

          yield self unless block == nil
        end

        def add_layout_parameter(name, value)
          @layout_parameters << {Name: name, Value: value}
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:hit_type_id] = @hit_type_id
          @parameters[:lifetime_in_seconds] = @lifetime_in_seconds
          @parameters[:max_assignments] = @max_assignments
          @parameters[:layout_id] = @layout_id unless @layout_id.nil?
          @parameters[:layout_parameters] = @layout_parameters unless @layout_parameters.empty?
          @parameters[:requester_annotation] = @requester_annotation unless @requester_annotation.nil?
          @parameters[:unique_request_token] = @unique_request_token unless @unique_request_token.nil?

          super 
        end
      end
    end
  end
end
