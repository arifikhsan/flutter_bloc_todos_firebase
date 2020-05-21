part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabUpdated extends TabEvent {
  final AppTab tab;

  TabUpdated(this.tab);

  @override
  List<Object> get props => [tab];
}