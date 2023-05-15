class Instructor < User
  belongs_to :college
  has_many :evaluation_results
  self.inheritance_column = :_type_disabled
  self.table_name = 'instructors'
end
