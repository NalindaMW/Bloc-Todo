/*

TO DO CUBIT - Simple state management

Each cubit is a list of todos

*/

import 'package:bloc_todo/domain/models/todo.dart';
import 'package:bloc_todo/domain/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // Refference todo repo
  final TodoRepo todoRepo;

  // Constructor initialize the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // Load
  Future<void> loadTodos() async {
    // fetch list of todos from the repo
    final todoList = await todoRepo.getTodos();

    // emit the fetched list as the new state
    emit(todoList);
  }

  // Add
  Future<void> addTodo(String todoTitle) async {
    // create a new todo with a unique id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: todoTitle,
    );

    // save the new todo to repo
    await todoRepo.addTodo(newTodo);

    // re-load
    loadTodos();
  }

  // Delete
  Future<void> deleteTodo(Todo todo) async {
    // delete the todo from repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // Toggle
  Future<void> toggleCompletion(Todo todo) async {
    // toggle the completion status of the given todo
    final updatedTodo = todo.toggleCompletion();

    // update the todo in the repo
    todoRepo.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}
