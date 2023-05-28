class RemoveHeadofdepartmentFromHoDDepartments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :ho_d_departments, :head_of_department, null: false, foreign_key: true
  end
end
