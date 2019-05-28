import React, { Component } from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import Student from './Student'

const FEED_QUERY = gql`
{
  allStudents{
    givenName
    lastName
  }
}
`
class StudentList extends Component {
    render() {
      return (
        <Query query={FEED_QUERY}>
          {({ loading, error, data }) => {
            if (loading) return <div>Fetching</div>
            if (error) return <div>Error</div>
      
            const studentsToRender = data.allStudents
      
            return (
              <div>
              {studentsToRender.map(student => <Student givenName={student.givenName} lastName={student.lastName} />)}
            </div>
            )
          }}
        </Query>
      )
    }
  }

  export default StudentList