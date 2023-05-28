class RemoveTypeFromInstructor < ActiveRecord::Migration[7.0]
  def change
    remove_column :instructors, :type, :string
  end
end
