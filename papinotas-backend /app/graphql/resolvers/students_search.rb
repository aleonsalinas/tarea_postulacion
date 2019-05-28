require 'search_object/plugin/graphql'

class Resolvers::StudentsSearch
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
  class StudentFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :rut_contains, String, required: false
    argument :given_name_contains, String, required: false
    argument :last_name_contains, String, required: false
    argument :phone_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: StudentFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Student.all
    scope = scope.like(:rut, value[:rut_contains]) if value[:rut_contains]
    scope = scope.like(:given_name, value[:given_name_contains]) if value[:given_name_contains]
    scope = scope.like(:last_name, value[:last_name_contains]) if value[:last_name_contains]
    scope = scope.like(:phone, value[:phone_contains]) if value[:phone_contains]
      
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end