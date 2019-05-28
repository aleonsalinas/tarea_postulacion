class Friend < ApplicationRecord
    belongs_to :student, class_name: "Student"
    belongs_to :student_friend, class_name: "Student"
  
    after_create :create_inverse, unless: :has_inverse?
    after_destroy :destroy_inverses, if: :has_inverse?
  
    def create_inverse
      self.class.create(inverse_relation_options)
    end
  
    def destroy_inverses
      inverses.destroy_all
    end
  
    def has_inverse?
      self.class.exists?(inverse_relation_options)
    end
  
    def inverses
      self.class.where(inverse_relation_options)
    end
  
    def inverse_relation_options
      { student_friend_id: student_id, student_id: student_friend_id }
    end
end
