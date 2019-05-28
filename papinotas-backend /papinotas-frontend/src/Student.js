import React, { Component } from 'react'

class Student extends Component {
  render() {
    return (
      <div>
        <div>
          {this.props.givenName} ({this.props.lastName})
        </div>
      </div>
    )
  }
}

export default Student