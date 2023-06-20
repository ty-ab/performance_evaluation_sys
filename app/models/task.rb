class Task < ApplicationRecord
  belongs_to :course
  belongs_to :department
  belongs_to :instructor
  has_one :evaluation_result
  has_many :evaluation_records
  has_and_belongs_to_many :students
  accepts_nested_attributes_for :students
end
