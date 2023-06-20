class Course < ApplicationRecord
    has_one :task
    validates :course_name, presence: true, uniqueness: true, length: { minimum: 3 }
end
