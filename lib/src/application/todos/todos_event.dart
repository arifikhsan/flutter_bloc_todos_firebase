part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos  extends TodosEvent {}

class AddTodo extends TodosEvent {
  final TodoModel todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class UpdateTodo extends TodosEvent {
  final TodoModel todo;

  const UpdateTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { todo: $todo }';
}

class TodosUpdated extends TodosEvent {
  final TodoModel todo;

  const TodosUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { todo: $todo }';
}
class DeleteTodo extends TodosEvent {
  final TodoModel todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}