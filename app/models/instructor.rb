class Instructor < ApplicationRecord
  belongs_to :college
  has_many :evaluation_results
  has_many :tasks
  has_one :ho_d_department
  has_one :department, through: :ho_d_department
  self.table_name = 'instructors'
  has_secure_password
end
