class AddColumnAttendanceInStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :attendance, :boolean
  end
end
