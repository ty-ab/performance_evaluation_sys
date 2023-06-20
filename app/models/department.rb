class Department < ApplicationRecord
  belongs_to :college
  has_many :students
  has_many :tasks
  has_one :ho_d_department
  has_one :head_of_department, through: :ho_d_department
end
