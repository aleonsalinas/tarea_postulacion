class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :student, index: true, foreign_key: true
      t.references :student_friend, index: true

      t.timestamps null: false
      
    end
    add_foreign_key :friends, :students, column: :student_friend_id
    add_index :friends, [:student_id, :student_friend_id], unique: true
 
  end
end
