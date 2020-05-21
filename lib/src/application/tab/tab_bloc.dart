import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_todos_firebase/src/core/model/app_tab.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  @override
  TabState get initialState => TabTodo();

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is TabUpdated) {
      if (event.tab == AppTab.todos) {
        yield TabTodo();
      } else {
        yield TabStats();
      }
    }
  }
}
