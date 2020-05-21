import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_todos_firebase/src/domain/repository/todos_repository.dart';
import 'package:flutter_bloc_todos_firebase/src/entity/todo_entity.dart';
import 'package:flutter_bloc_todos_firebase/src/model/todo_model.dart';

class FirebaseTodosRepository implements TodosRepository {
  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(TodoModel todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(TodoModel todo) {
    return todoCollection.document(todo.id).delete();
  }

  @override
  Stream<List<TodoModel>> todos() {
    return todoCollection.snapshots().map(
      (snapshot) {
        return snapshot.documents
            .map(
              (document) => TodoModel.fromEntity(
                TodoEntity.fromSnapshot(document),
              ),
            )
            .toList();
      },
    );
  }

  @override
  Future<void> updateTodo(TodoModel todo) {
    return todoCollection
        .document(todo.id)
        .updateData(todo.toEntity().toDocument());
  }
}
