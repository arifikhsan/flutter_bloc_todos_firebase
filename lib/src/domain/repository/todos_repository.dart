import 'package:flutter_bloc_todos_firebase/src/data/model/todo_model.dart';

abstract class TodosRepository {
  Stream<List<TodoModel>> todos();
  Future<void> addNewTodo(TodoModel todo);
  Future<void> deleteTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
}
