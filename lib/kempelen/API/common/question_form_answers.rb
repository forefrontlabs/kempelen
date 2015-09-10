require 'nori'

module Kempelen
  module API
    module Common
      class QuestionFormAnswers
        attr_accessor :answers

        def initialize(answer = nil)
          @answers = []

          load_from_answer(answer) unless answer.nil?
        end

        # <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        #<QuestionFormAnswers xmlns="http://mechanicalturk.amazonaws.com/AWSMechanicalTurkDataSchemas/2005-10-01/QuestionFormAnswers.xsd">
        #  <Answer>
        #    <QuestionIdentifier>TranscriptionTexts</QuestionIdentifier>
        #    <FreeText>This is the second test.</FreeText>
        #  </Answer>
        #</QuestionFormAnswers>

        def load_from_answer(answer)
          parser = Nori.new(:parser => :rexml)
          parsed_data = parser.parse(answer)
          answer_list = parsed_data["QuestionFormAnswers"]["Answer"]

          unless answer_list.is_a?(Array)
            answer_list = [answer_list]
          end

          answer_list.each do |answer_data|
            if answer_data.has_key?("FreeText")
              @answers << FreeTextAnswer.new(answer_data["QuestionIdentifier"].to_s, answer_data["FreeText"].to_s)
            elsif answer_data.has_key?("SelectionIdentifier") or answer_data.has_key?("OtherSelectionText")
              new_answer = MultipleChoiceAnswer.new(answer_data["QuestionIdentifier"].to_s)

              selection = answer_data["SelectionIdentifier"]
              if selection.is_a?(Array)
                new_answer.selection_identifiers += selection
              else
                new_answer.selection_identifiers << selection
              end
              new_answer.other_selection_text = answer_data["OtherSelectionText"]

              @answers << new_answer
            end
          end
        end
      end
    end
  end
end
