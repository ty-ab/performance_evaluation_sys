class Task < ApplicationRecord
  belongs_to :course
  belongs_to :department
  belongs_to :instructor
  belongs_to :semester
  has_and_belongs_to_many :students
  accepts_nested_attributes_for :students
end
