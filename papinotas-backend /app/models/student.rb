class Student < ApplicationRecord
  has_many :friends
  has_many :student_friends, through: :friends, dependent: :destroy
  scope :like, ->(field, value) { where arel_table[field].matches("%#{value}%") }

end
