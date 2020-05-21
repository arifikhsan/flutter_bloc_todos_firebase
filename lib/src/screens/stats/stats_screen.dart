import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/stats/stats_bloc.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(builder: (context, state) {
      if (state is StatsLoadInProgress) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is StatsLoadSuccess) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Completed Todos',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 8),
              Text(
                '${state.numCompleted}',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16),
              Text(
                'Active Todos',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 8),
              Text(
                '${state.numActive}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
