import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/authentication/authentication_bloc.dart';

class UnauthenticatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unauthenticated'),
      ),
      body: RaisedButton(
        color: Colors.blue,
        child: Text(
          'Sign in Anonymously',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(SignInAnonymously());
        },
      ),
    );
  }
}
