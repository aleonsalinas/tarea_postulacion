import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogTitle from '@material-ui/core/DialogTitle';
import Fab from '@material-ui/core/Fab';
import { makeStyles } from '@material-ui/core/styles';
import AddIcon from '@material-ui/icons/Add';
import SendIcon from '@material-ui/icons/Announcement';
import EditIcon from '@material-ui/icons/Edit';
import gql from 'graphql-tag'
import { Mutation } from "react-apollo";

const CREATE_STUDENT = gql`
  mutation createStudent($givenName: String!, $lastName: String!, $rut: String!, $listNumber: Integer!, $phone: Integer!) {
    createStudent(rut: $rut, lastName: $lastName, givenName: $givenName,listNumber: $listNumber, phone: $phone) {
      givenName
      lastName
    }
  }
`;

const useStyles = makeStyles(theme => ({
    fab: {
      margin: theme.spacing(1),
    },
    extendedIcon: {
      marginRight: theme.spacing(1),
    },
}));

function FormDialog() {
  
  const classes = useStyles();
  const [open, setOpen] = React.useState(false);
 
  function handleClickOpen() {
    setOpen(true);

  }
  function handleClose() {
    setOpen(false);
  }
  function handleCancel() {
    setOpen(false);
  }

  return (
    <div>
      <Fab color="primary" aria-label="Add" className={classes.fab} onClick={handleClickOpen}>
        <AddIcon />
      </Fab>
      <Mutation mutation={CREATE_STUDENT}>
                {createStudent => (
                   <Dialog open={open} onClose={handleClose} aria-labelledby="form-dialog-title">
                   <DialogTitle id="form-dialog-title">Agregar Alumno</DialogTitle>
                   <DialogContent>
                     <TextField
                       autoFocus
                       margin="dense"
                       id="given_name"
                       label="Nombres"
                       type="text"
                       fullWidth
                     />
                     <TextField
                       margin="dense"
                       id="last_name"
                       label="Apellidos"
                       type="text"
                       fullWidth
                     />
                     <TextField
                       margin="dense"
                       id="rut"
                       label="Celular"
                       type="string"
                       fullWidth
                     />
                       <TextField
                       margin="dense"
                       id="number"
                       label="Número de Lista"
                       type="number"
                       fullWidth
                     />
                      <TextField
                       margin="dense"
                       id="phone"
                       label="Celular"
                       type="phone"
                       fullWidth
                     />
                     
                   </DialogContent>
                   <DialogActions>
                     <Button onClick={handleCancel} color="primary">
                       Cancelar
                     </Button>
                     <Button onClick={handleCancel} color="primary">
                       Agregar
                     </Button>
                   </DialogActions>
                 </Dialog>
                )}

                </Mutation>
      
      <Fab  aria-label="Edit" className={classes.fab}>
        <EditIcon/>
      </Fab>
      <Fab color="secondary" aria-label="Send" className={classes.fab}>
        <SendIcon />
      </Fab>    
    </div>
  );
}


export default FormDialog;