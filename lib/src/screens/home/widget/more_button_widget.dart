import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/todos/todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/core/model/extra_action.dart';

class MoreButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        // bool allComplete =
        //     (BlocProvider.of<TodosBloc>(context).state as TodosLoaded)
        //         .todos
        //         .every(
        //           (element) => element.complete,
        //         );
        if (state is TodosLoaded) {
          bool allComplete =
              (BlocProvider.of<TodosBloc>(context).state as TodosLoaded)
                  .todos
                  .every((todo) => todo.complete);
          return PopupMenuButton(
            icon: Icon(Icons.swap_horiz),
            onSelected: (action) {
              switch (action) {
                case ExtraAction.clearCompleted:
                  BlocProvider.of<TodosBloc>(context).add(ClearCompleted());
                  break;
                case ExtraAction.toggleAllComplete:
                  BlocProvider.of<TodosBloc>(context).add(ToggleAll());
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: ExtraAction.toggleAllComplete,
                  child: Text(
                    allComplete ? 'Mark all incomplete' : 'Mark all complete',
                  ),
                ),
                PopupMenuItem(
                  value: ExtraAction.clearCompleted,
                  child: Text('Clear completed'),
                ),
              ];
            },
          );
        } else if (state is TodosLoadInProgress) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
