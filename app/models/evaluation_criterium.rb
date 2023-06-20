class EvaluationCriterium < ApplicationRecord
	validates :description, presence: true, uniqueness: true, length: { minimum: 15 }
	validates :for, presence: true
end
