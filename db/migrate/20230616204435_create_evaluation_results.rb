class CreateEvaluationResults < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_results do |t|
      t.jsonb :percentage_agreement
      t.float :overall_percentage_agreement
      t.references :evaluation_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
