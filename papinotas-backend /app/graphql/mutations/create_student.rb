module Mutations
    class CreateStudent < BaseMutation
  
      argument :given_name, String, required: true
      argument :last_name, String, required: true
      argument :rut, String, required: true
      argument :list_number, Integer, required: true
      argument :phone, String, required: false
  
      type Types::StudentType
  
      def resolve(given_name: nil, last_name: nil, rut: nil, list_number: nil, phone: nil)
        Student.create!(
          given_name: given_name,
          last_name: last_name,
          rut: rut,
          list_number: list_number,
          phone: phone
        )
      end
    end
end