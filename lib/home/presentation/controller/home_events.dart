import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

}
class ToggleCurrentIndexNumberEvent extends HomeEvent {
  final int newCurrentIndex;
  const ToggleCurrentIndexNumberEvent({required this.newCurrentIndex,});
  @override
  List<Object?> get props => [newCurrentIndex];
}

class GetHomePostsEvent extends HomeEvent{
  final BuildContext context;
  const GetHomePostsEvent({
    required this.context,
});

  @override
  List<Object?> get props => [context];
}

class GetPromotePostsEvent extends HomeEvent{
  final BuildContext context;
  const GetPromotePostsEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [context];
}

class GetCategoriesEvent extends HomeEvent{
  final BuildContext context;
  const GetCategoriesEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [context];
}