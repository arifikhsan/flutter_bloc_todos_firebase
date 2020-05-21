part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

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
  String toString() => 'UpdateTodo { todo: $todo }';
}

class TodosUpdated extends TodosEvent {
  final List<TodoModel> todos;

  const TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosUpdated { todo: $todos }';
}

class DeleteTodo extends TodosEvent {
  final TodoModel todo;

  const DeleteTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}
