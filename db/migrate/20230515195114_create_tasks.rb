class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :course, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
