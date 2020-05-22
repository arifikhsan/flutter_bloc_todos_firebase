import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/todos/todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/add_edit/add_edit_screen.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoaded) {
          final todo = state.todos.firstWhere(
            (todo) => todo.id == id,
            orElse: () => null,
          );
          return Scaffold(
            appBar: AppBar(
              title: Text('Todo detail'),
              // actions: <Widget>[
              //   IconButton(
              //     icon: Icon(Icons.delete),
              //     onPressed: () {
              // BlocProvider.of<TodosBloc>(context).add(DeleteTodo(todo));
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('Todo deleted'),
              //     duration: Duration(seconds: 2),
              //   ),
              // );
              // },
              // ),
              // ],
            ),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Checkbox(
                          value: todo.complete,
                          onChanged: (_) {
                            context.bloc<TodosBloc>().add(
                                  UpdateTodo(
                                    todo.copyWith(complete: !todo.complete),
                                  ),
                                );
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                todo.task,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                todo.note,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddEditScreen(
                        isEditing: true,
                        todo: todo,
                        onSave: (task, note) {
                          BlocProvider.of<TodosBloc>(context).add(
                            UpdateTodo(
                              todo.copyWith(
                                task: task,
                                note: note,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
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
