import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter todos firebase'),
      ),
      body: Center(
        child: Text('todos'),
      ),
    );
  }
}
