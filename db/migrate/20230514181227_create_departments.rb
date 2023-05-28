class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :dep_name
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
