import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/filtered_todos/filtered_todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/core/model/visibility_filter.dart';

class FilterButtonWidget extends StatefulWidget {
  final bool visible;

  const FilterButtonWidget({Key key, this.visible}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final activeStyle = TextStyle(color: Theme.of(context).accentColor);

    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
      builder: (context, state) {
        if (state is FilteredTodosLoadSuccess) {
          return PopupMenuButton(
            icon: Icon(Icons.format_line_spacing),
            onSelected: (filter) {
              BlocProvider.of<FilteredTodosBloc>(context).add(
                FilterUpdated(filter),
              );
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: VisibilityFilter.all,
                  child: Text(
                    'Show All',
                    style: state.activeFilter == VisibilityFilter.all
                        ? activeStyle
                        : null,
                  ),
                ),
                PopupMenuItem(
                  value: VisibilityFilter.active,
                  child: Text(
                    'Show Active',
                    style: state.activeFilter == VisibilityFilter.active
                        ? activeStyle
                        : null,
                  ),
                ),
                PopupMenuItem(
                  value: VisibilityFilter.completed,
                  child: Text('Show Completed',
                      style: state.activeFilter == VisibilityFilter.completed
                          ? activeStyle
                          : null),
                ),
              ];
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
