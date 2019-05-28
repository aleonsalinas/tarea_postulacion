module Types
  class MutationType < BaseObject
    field :edit_attendance_student, mutation: Mutations::EditAttendanceStudent
    field :delete_student, mutation: Mutations::DeleteStudent
    field :create_student, mutation: Mutations::CreateStudent
    field :create_user, mutation: Mutations::CreateUser
    field :create_link, mutation: Mutations::CreateLink
    field :create_vote, mutation: Mutations::CreateVote
    field :signin_user, mutation: Mutations::SignInUser
  end
end