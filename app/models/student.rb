class Student < ApplicationRecord
  belongs_to :college
  belongs_to :department
  belongs_to :semester
  has_and_belongs_to_many  :tasks
  has_secure_password
  #self.inheritance_column = :_type_disabled
  #self.table_name = 'students'
end
