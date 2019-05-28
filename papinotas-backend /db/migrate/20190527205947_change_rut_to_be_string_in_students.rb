class ChangeRutToBeStringInStudents < ActiveRecord::Migration[5.2]
  def up
    change_column :students, :rut, :string
  end

  def down
    change_column :students, :rut, :integer
  end
end
