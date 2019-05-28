module Types
  class StudentType < BaseObject
    field :givenName, ID, null: false
    field :lastName, String, null: false
    field :rut, String, null: false
    field :listNumber, Integer, null: true
    field :phone, String, null: true
    field :student_friends, [StudentType],null: true  
    field :attendance, Boolean, null: true
  end
end