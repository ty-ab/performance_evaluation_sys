class AddStartEvalToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :start_eval, :boolean
  end
end
