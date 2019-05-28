class AddColumnListNumberInStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :list_number, :integer
  end
end
