import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/todos/todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/data/repository/firebase_todos_repository.dart';
import 'package:flutter_bloc_todos_firebase/src/data/repository/firebase_user_repository.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: FirebaseUserRepository(),
          )..add(AppStarted()),
        ),
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc(
            todosRepository: FirebaseTodosRepository(),
          )..add(LoadTodos()),
        ),
      ],
      child: MaterialApp(
        title: 'Firestore todos',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return Text('authenticated');
                } else if (state is Unauthenticated) {
                  return Text('unauthenticated');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
          '/addTodo': (context) {
            return Text('addtodo!');
          }
        },
      ),
    );
  }
}
