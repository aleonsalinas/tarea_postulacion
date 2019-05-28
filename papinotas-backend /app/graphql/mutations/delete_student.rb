module Mutations
    class DeleteStudent < BaseMutation
      argument :rut, String, required: true
  
      type Types::StudentType
  
      def resolve(rut: nil)
        Student.find_by(
          rut: rut).destroy
      end
    end
end