import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/filtered_todos/filtered_todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/todos/todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/data/model/todo_model.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
      builder: (context, state) {
        if (state is FilteredTodosLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilteredTodosLoadSuccess) {
          final todos = state.filteredTodos;
          print(todos);
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final TodoModel todo = todos[index];
              return Dismissible(
                key: Key(todo.id),
                onDismissed: (direction) {
                  BlocProvider.of<TodosBloc>(context).add(DeleteTodo(todo));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Todo deleted'),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        BlocProvider.of<TodosBloc>(context).add(AddTodo(todo));
                      },
                    ),
                  ));
                },
                child: ListTile(
                  leading: Checkbox(
                    value: todo.complete,
                    onChanged: (_) {
                      BlocProvider.of<TodosBloc>(context).add(
                        UpdateTodo(
                          todo.copyWith(complete: !todo.complete),
                        ),
                      );
                    },
                  ),
                  title: Hero(
                    tag: todo.id,
                    child: Text(todo.task),
                  ),
                  subtitle: todo.note.isNotEmpty
                      ? Text(
                          todo.note,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
