class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.references :college, null: false, foreign_key: true
      t.timestamps
    end
  end
end
