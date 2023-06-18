class RemoveCriteriaFromEvaluationCriterium < ActiveRecord::Migration[7.0]
  def change
    remove_column :evaluation_criteria, :criteria, :string
  end
end
