class CreateEvaluationResults < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_results do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.text :detailed_result
      t.float :total_result

      t.timestamps
    end
  end
end