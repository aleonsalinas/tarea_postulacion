# Attendance Tracker

## Requirements
- Install ruby and rails
- Install npm

## Installation

### 1. Clone or download this repository:
```shell
git clone https://github.com/aleonsalinas/tarea_postulacion.git
```
### 2. Open the root directory:
```shell
cd papinotas-backend
```
### 3. Run the following to start rails server:
```shell
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s -p 3000
```
### 4. Change directory and start react app:
```shell
cd papinotas-frontend
npm install
npm start
Y
```
# The Application Objectives
1. The parents can inform to the class why the student is not present today.
2. School and parents can know if a student is absent without an informed reason (the student didn't enter to class or had an inconvenient on the way to school)
2. The system register that the student is absent.

# Suppositions

1. This application and backend are considered a prototype, didn't have the requirements to be in production.
2. The list of students is only for one school class, the support to add more classes is coming.

# Considerations

1. The list of students is not ordered by Last Name or list numbers.

# Finished and To Do
## Finished
- Queries on graphql
  * __allStudent__ (includes filter for search implementation)
  * __friends__
- Mutations on graphql
  * __createStudent__
  * __deleteStudent__
  * __editAttendanceStudent__

## To Do
- Finish creation and deletion of students on react frontend, using mutations.
- Search engine using query allStudent on react frontend.
- Unit testing for queries and mutations on rails app.
- Unit testing for components of react app.


Released under the [Apache 2.0](LICENSE-APACHE) license.

