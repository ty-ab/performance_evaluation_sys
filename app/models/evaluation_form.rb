class EvaluationForm < ApplicationRecord
    # serialize :form_fields, JSON
    validates :evaluator, presence: true, uniqueness: true, length: { minimum: 2 }
    validates :form_fields, presence: true, length: { minimum: 15 }
end
