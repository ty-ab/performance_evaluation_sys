class EvaluationRecord < ApplicationRecord
	belongs_to :task
	has_one :evaluation_result
end
