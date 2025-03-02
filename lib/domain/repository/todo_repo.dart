/*
TODO Repository

Here we define what the app can do
*/

import 'package:bloc_todo/domain/models/todo.dart';

abstract class TodoRepo {
  //get list of todos
  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodo(Todo newTodo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}

/*
Notes:
- The repo in the domain layer outlines what operations the app can do. 
But doesn't worry about the specific implementation details.
Thats for the data layer.

- Technology Agnostic: Independant of any technology or framework.
*/
