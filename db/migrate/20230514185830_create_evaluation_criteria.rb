class CreateEvaluationCriteria < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_criteria do |t|
      t.string :criteria

      t.timestamps
    end
  end
end
