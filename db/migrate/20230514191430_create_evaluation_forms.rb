class CreateEvaluationForms < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluation_forms do |t|
      t.string :evaluator
      t.text :form

      t.timestamps
    end
  end
end
