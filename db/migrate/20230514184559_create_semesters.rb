class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.date :start
      t.date :end
      t.string :sem
      t.boolean :status

      t.timestamps
    end
  end
end
