module Types
  class QueryType < BaseObject
    field :all_students, function: Resolvers::StudentsSearch
    field :friends, function: Resolvers::FriendResolver
  end
end
