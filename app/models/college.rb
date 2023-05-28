class College < ApplicationRecord
    has_many :departments
    has_many :students
    has_many :instructors
end
