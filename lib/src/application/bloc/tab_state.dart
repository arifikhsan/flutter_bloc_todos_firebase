part of 'tab_bloc.dart';

abstract class TabState extends Equatable {
  const TabState();

  @override
  List<Object> get props => [];
}

class TabTodo extends TabState {}

class TabStats extends TabState {}
