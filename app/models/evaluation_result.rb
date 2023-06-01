class EvaluationResult < ApplicationRecord
  belongs_to :instructor
  belongs_to :semester
  # serialize :detailed_result, Array
end
