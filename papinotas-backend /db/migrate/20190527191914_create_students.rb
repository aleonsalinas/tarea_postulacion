class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :given_name
      t.string :last_name
      t.integer :rut
      t.string :phone

      t.timestamps
    end
  end
end
