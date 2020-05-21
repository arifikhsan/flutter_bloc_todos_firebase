import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String note;
  final String task;
  final bool complete;

  TodoEntity(this.id, this.note, this.task, this.complete);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'note': note,
      'task': task,
      'complete': complete,
    };
  }

  @override
  List<Object> get props => [id, note, task, complete];

  @override
  String toString() {
    return 'TodoEntity { id: $id, note: $note, task: $task, complete: $complete }';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['id'] as String,
      json['note'] as String,
      json['task'] as String,
      json['complete'] as bool,
    );
  }

  static TodoEntity fromSnapshot(DocumentSnapshot snapshot) {
    return TodoEntity(
      snapshot.documentID,
      snapshot.data['note'],
      snapshot.data['task'],
      snapshot.data['complete'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'note': note,
      'task': task,
      'complete': complete,
    };
  }
}
