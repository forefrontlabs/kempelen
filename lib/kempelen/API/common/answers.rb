module Kempelen
  module API
    module Common
      class Answer
        attr_accessor :question_identifier

        def initialize(question_identifier)
          @question_identifier = question_identifier
        end
      end

      class FreeTextAnswer < Answer
        attr_accessor :free_text

        def initialize(question_identifier, free_text)
          super(question_identifier)

          @free_text = free_text
        end
      end

      class MultipleChoiceAnswer < Answer
        attr_accessor :selection_identifiers
        attr_accessor :other_selection_text

        def initialize(question_identifier)
          super(question_identifier)

          @selection_identifiers = []
        end
      end
    end
  end
end
