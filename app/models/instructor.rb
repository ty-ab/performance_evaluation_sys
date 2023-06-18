class Instructor < ApplicationRecord
  belongs_to :college
  has_many :evaluation_results
  has_one :ho_d_department
  has_one :department, through: :ho_d_department
  self.table_name = 'instructors'
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
