import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/auth/loading_screen.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/auth/unauthenticated_screen.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/home/home_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen();
        } else if (state is Unauthenticated) {
          return UnauthenticatedScreen();
        } else {
          return LoadingScreen();
        }
      },
    );
  },
  '/addTodo': (context) {
    return Text('addtodo!');
  }
};
