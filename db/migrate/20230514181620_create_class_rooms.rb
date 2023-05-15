class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.string :classroom_name

      t.timestamps
    end
  end
end
