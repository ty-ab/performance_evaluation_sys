class CreateEvaluationResults < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_results do |t|
      t.jsonb :combined_mean
      t.float :total_percentage
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
