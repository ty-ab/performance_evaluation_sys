class CreateJoinTableTaskStudent < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tasks, :students do |t|
      # t.index [:task_id, :student_id]
      # t.index [:student_id, :task_id]
    end
  end
end
