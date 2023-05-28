class RenameFormInEvaluationForm < ActiveRecord::Migration[7.0]
  def change
    rename_column :evaluation_forms, :form, :form_fields
  end
end
