import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import { Mutation } from "react-apollo";
const FEED_QUERY = gql`
{
  allStudents{
    givenName
    lastName
    rut
    attendance
  }
}
`

const EDIT_ATTENDACE = gql`
  mutation editAttendanceStudent($rut: String!, $attendance: Boolean!) {
    editAttendanceStudent(rut: $rut, attendance: $attendance) {
      attendance
    }
  }
`;


const useStyles = makeStyles(theme => ({
  root: {
    width: '100%',
    
    backgroundColor: theme.palette.background.paper,
  },
}));

function ListCheckBox() {
  const classes = useStyles();
  const [checked, setChecked] = React.useState([1]);

  const handleToggle = (student,index,rut,editAttendance,attendance)=> () => {
    const newChecked = [...checked];
    if (attendance) {
      newChecked[index] = 0;
    } else {
      newChecked[index] = 1;
    }
    student.attendance = !attendance;
    setChecked(newChecked);
    editAttendance({variables: {rut:student.rut,attendance:student.attendance}});

  };

  return (
     <Query query={FEED_QUERY}>
          {({ loading, error, data }) => {
            if (loading) return <div>Fetching</div>
            if (error) return <div>Error</div>
      
            const studentsToRender = data.allStudents
      
            return (
              <div>
                <List dense className={classes.root}>
              {studentsToRender.map((student, index) => 
                <Mutation mutation={EDIT_ATTENDACE} key={student.rut}>
                {editAttendance => (
                   <ListItem key={student.rut} button>
                   <ListItemText primary={student.givenName+" "+student.lastName} />
                   <ListItemSecondaryAction>
                     <Checkbox
                       edge="end"
                       onChange={handleToggle(student,index,student.rut,editAttendance,student.attendance)}
                       checked={student.attendance}
                       />
                       </ListItemSecondaryAction>
                     </ListItem>
                )}

                </Mutation>
          
     )}

    </List>
            </div>
            )
          }}
        </Query>
 
  );
}

export default ListCheckBox;