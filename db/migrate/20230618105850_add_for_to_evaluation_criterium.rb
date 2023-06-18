class AddForToEvaluationCriterium < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluation_criteria, :for, :string
  end
end
