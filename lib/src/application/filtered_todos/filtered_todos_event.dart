part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();
}

class FilterUpdated extends FilteredTodosEvent {
  final VisibilityFilter filter;

  FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];
}

class TodosUpdated extends FilteredTodosEvent {
  final List<TodoModel> todos;

  TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];
}
