class Task < ApplicationRecord
  belongs_to :course
  belongs_to :department
  belongs_to :instructor
  belongs_to :semester
end
