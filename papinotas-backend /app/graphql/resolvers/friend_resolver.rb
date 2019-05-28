require 'search_object/plugin/graphql'

class Resolvers::FriendResolver
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Student.all }

  type types[Types::StudentType]

  option :first, type: types.Int, with: :apply_first
  option :skip, type: types.Int, with: :apply_skip

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end
  # inline input type definition for the advance filter
  class FriendsFilter < ::Types::BaseInputObject
    argument :rut, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: FriendsFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    scope = Student.find_by(rut: value[:rut])
    scope.student_friends
  end
  
end