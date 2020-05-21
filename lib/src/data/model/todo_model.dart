import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_todos_firebase/src/domain/entity/todo_entity.dart';

@immutable
class TodoModel {
  final String id;
  final String note;
  final String task;
  final bool complete;

  TodoModel(
    this.task, {
    id,
    note = '',
    this.complete = false,
  })  : this.note = note ?? '',
        this.id = id;

  TodoModel copyWith({
    String id,
    String note,
    String task,
    bool complete,
  }) {
    return TodoModel(
      task ?? this.task,
      id: id ?? this.id,
      note: note ?? this.note,
      complete: complete ?? this.complete,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ note.hashCode ^ task.hashCode ^ complete.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModel &&
          id == other.id &&
          note == other.note &&
          task == other.task &&
          complete == other.complete &&
          runtimeType == other.runtimeType;

  @override
  String toString() {
    return 'TodoModel { id: $id, note: $note, task: $task, complete: $complete }';
  }

  TodoEntity toEntity() {
    return TodoEntity(id, note, task, complete);
  }

  static TodoModel fromEntity(TodoEntity entity) {
    return TodoModel(
      entity.task,
      id: entity.id,
      note: entity.note,
      complete: entity.complete ?? false,
    );
  }
}
