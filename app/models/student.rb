class Student < User
  belongs_to :college
  belongs_to :department
  belongs_to :class_room
  belongs_to :semester
  has_and_belongs_to_many :courses
  self.inheritance_column = :_type_disabled
  self.table_name = 'students'

end
