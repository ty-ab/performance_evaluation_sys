class AddEvaluatorsToEvaluationResult < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluation_results, :evaluators, :string
  end
end
