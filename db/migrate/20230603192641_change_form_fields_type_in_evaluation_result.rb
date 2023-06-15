class ChangeFormFieldsTypeInEvaluationResult < ActiveRecord::Migration[7.0]
  def change
    change_column :evaluation_results, :detailed_result, :jsonb, using: 'detailed_result::jsonb'
  end
end
