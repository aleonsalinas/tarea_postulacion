module Mutations
    class EditAttendanceStudent < BaseMutation
  
      argument :attendance, Boolean, required: true
      argument :rut, String, required: true
  
      type Types::StudentType
  
      def resolve(attendance: nil, rut: nil)
        student = Student.find_by(rut: rut)
        student.update(attendance: attendance)
        
        student
    
      end
    end
end