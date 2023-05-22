class CreateHoDDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :ho_d_departments do |t|
      t.references :head_of_department, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
