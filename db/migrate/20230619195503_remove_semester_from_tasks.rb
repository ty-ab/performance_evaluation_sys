class RemoveSemesterFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :semester, foreign_key: true
  end
end
