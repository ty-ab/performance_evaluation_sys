class CreateEvaluationRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_records do |t|
      t.jsonb :record
      t.string :evaluators
      t.references :task, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
