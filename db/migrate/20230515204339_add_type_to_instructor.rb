class AddTypeToInstructor < ActiveRecord::Migration[7.0]
  def change
    add_column :instructors, :type, :string
  end
end
