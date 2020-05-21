import 'package:flutter_bloc_todos_firebase/src/model/todo_model.dart';

abstract class TodosRepository {
  Future<void> addNewTodo(TodoModel todo);
  Future<void> deleteTodo(TodoModel todo);
  Stream<List<TodoModel>> todos();
  Future<void> updateTodo(TodoModel todo);
}
