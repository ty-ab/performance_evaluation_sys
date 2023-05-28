class AddDesctriptionToEvaluationCriterium < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluation_criteria, :description, :string
  end
end
