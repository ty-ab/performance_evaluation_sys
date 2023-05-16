class RemoveClassRoomIdFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_reference :students, :class_room, null: false, foreign_key: true
  end
end
