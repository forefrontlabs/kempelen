module Kempelen
  module API
    module Operations
      class RegisterHitType < Base
        attr_accessor :title
        attr_accessor :description
        attr_accessor :reward
        attr_accessor :assignment_duration
        attr_accessor :keywords
        attr_accessor :auto_approval_delay

        # TODO: Support qualification requirements
        attr_accessor :qualification_requirement

        AWS_OPERATION_NAME = "RegisterHITType".freeze

        def initialize(client, title, description, reward, assignment_duration, &block)
          super(client)

          @title = title
          @description = description
          @reward = reward
          @assignment_duration = assignment_duration
          @keywords = []

          yield self unless block == nil
        end

        def amazon_keywords
          @keywords.map {|k| k.strip}.join(',')
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:title] = @title
          @parameters[:description] = @description
          @parameters[:reward] = @reward
          @parameters[:assignment_duration] = @assignment_duration
          @parameters[:keywords] = amazon_keywords
          @parameters[:auto_approval_delay] = @auto_approval_delay

          super 
        end
      end
    end
  end
end
