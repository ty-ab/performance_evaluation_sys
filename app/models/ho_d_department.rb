class HoDDepartment < ApplicationRecord
  belongs_to :instructor
  belongs_to :department
end
