import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos_firebase/src/data/model/todo_model.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final TodoModel todo;
  final OnSaveCallback onSave;

  const AddEditScreen({
    Key key,
    @required this.isEditing,
    @required this.onSave,
    this.todo,
  }) : super(key: key);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String task;
  String note;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: isEditing ? widget.todo.task : '',
                autofocus: !isEditing,
                style: textTheme.headline5,
                decoration: InputDecoration(hintText: 'New Todo'),
                validator: (value) {
                  return value.trim().isEmpty ? 'Cannot empty' : null;
                },
                onSaved: (value) => task = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.todo.note : '',
                maxLines: 10,
                style: textTheme.subtitle1,
                decoration: InputDecoration(hintText: 'Note description'),
                onSaved: (value) => note = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add todo',
        child: Icon(isEditing ? Icons.check : Icons.save),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            widget.onSave(task, note);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
