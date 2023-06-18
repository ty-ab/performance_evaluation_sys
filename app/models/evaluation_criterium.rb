class EvaluationCriterium < ApplicationRecord
	validates :description, presence: true
	validates :for, presence: true
end
