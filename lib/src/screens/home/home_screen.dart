import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/filtered_todos/filtered_todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/stats/stats_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/tab/tab_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/application/todos/todos_bloc.dart';
import 'package:flutter_bloc_todos_firebase/src/core/model/app_tab.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/stats/stats_screen.dart';
import 'package:flutter_bloc_todos_firebase/src/screens/todo/todos_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<FilteredTodosBloc>(
          create: (context) => FilteredTodosBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
        BlocProvider<StatsBloc>(
          create: (context) => StatsBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, snapshot) {
          int currentTab = snapshot is TabTodo ? 0 : 1;

          return Scaffold(
            appBar: AppBar(
              title: Text('Flutter Todos Firebase'),
            ),
            body: snapshot is TabTodo ? TodosScreen() : StatsScreen(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTab,
              onTap: (index) {
                AppTab tab = index == 0 ? AppTab.todos : AppTab.stats;
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab));
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text('Todos'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq),
                  title: Text('Stats'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}