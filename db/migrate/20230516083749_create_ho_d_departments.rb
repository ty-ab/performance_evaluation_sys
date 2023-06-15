class CreateHoDDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :ho_d_departments do |t|
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
