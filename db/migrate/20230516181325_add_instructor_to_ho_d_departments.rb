class AddInstructorToHoDDepartments < ActiveRecord::Migration[7.0]
  def change
    add_reference :ho_d_departments, :instructor, null: false, foreign_key: true
  end
end
