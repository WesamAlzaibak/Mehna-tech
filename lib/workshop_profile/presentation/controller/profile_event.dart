import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WorkshopProfileEvent extends Equatable{
  const WorkshopProfileEvent();
}

class GetWorkshopProfileEvent extends WorkshopProfileEvent{
  final int workshopId;
  final BuildContext context;
  const GetWorkshopProfileEvent({
    required this.workshopId,
    required this.context,
  });

  @override
  List<Object?> get props => [workshopId,context];
}

class GetWorkshopPostsEvent extends WorkshopProfileEvent{
  final int workshopId;
  final BuildContext context;
  const GetWorkshopPostsEvent({
    required this.workshopId,
    required this.context,
  });

  @override
  List<Object?> get props => [workshopId,context];
}

class PostFollowProfileEvent extends WorkshopProfileEvent{
  final int workshopId;
  final BuildContext context;
  const PostFollowProfileEvent({
    required this.workshopId,
    required this.context,
  });

  @override
  List<Object?> get props => [workshopId,context];
}

class ToggleFollowBottomEvent extends WorkshopProfileEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PutFollowBottomValueEvent extends WorkshopProfileEvent{
  final bool isWorkshopFollowed;
  const PutFollowBottomValueEvent({required this.isWorkshopFollowed,});
  @override
  List<Object?> get props => [isWorkshopFollowed];
}