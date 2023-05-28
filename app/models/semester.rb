class Semester < ApplicationRecord
    has_many :students
    has_one :evaluation_result
end
