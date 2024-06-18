import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_posts.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_event.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_state.dart';

class WorkshopProfileBloc extends Bloc<WorkshopProfileEvent, WorkshopProfileState> {
  WorkshopProfileBloc(this.getWorkshopProfileUseCase, this.getWorkshopPostsUseCase, this.postFollowProfileUseCase) : super(const WorkshopProfileState()) {
    on<GetWorkshopProfileEvent>(_getWorkshopProfile);
    on<GetWorkshopPostsEvent>(_getWorkshopPosts);
    on<PostFollowProfileEvent>(_postFollowProfile);
    on<ToggleFollowBottomEvent>(_toggleFollowBottom);
    on<PutFollowBottomValueEvent>(_putFollowBottomValue);
  }
  final GetWorkshopProfileUseCase getWorkshopProfileUseCase;
  final GetWorkshopPostsUseCase getWorkshopPostsUseCase;
  final PostFollowWorkshopUseCase postFollowProfileUseCase;

  FutureOr<void> _getWorkshopProfile(GetWorkshopProfileEvent event, Emitter<WorkshopProfileState> emit) async {
    final result = await getWorkshopProfileUseCase(WorkshopProfileParameters(workshopId: event.workshopId , context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            workshopProfileState: RequestState.error,
            workshopProfileMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                workshopProfileState: RequestState.loaded,
                workshopProfile: r,
              ))
      );
    } else {
      emit(state.copyWith(
        workshopProfileState: RequestState.error,
        workshopProfileMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getWorkshopPosts(GetWorkshopPostsEvent event, Emitter<WorkshopProfileState> emit) async {
    final result = await getWorkshopPostsUseCase(WorkshopProfileParameters(workshopId: event.workshopId , context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            workshopPostsState: RequestState.error,
            workshopPostsMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                workshopPostsState: RequestState.loaded,
                workshopPosts: r,
              ))
      );
    } else {
      emit(state.copyWith(
        workshopPostsState: RequestState.error,
        workshopPostsMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _postFollowProfile(PostFollowProfileEvent event, Emitter<WorkshopProfileState> emit) async {
    final result = await postFollowProfileUseCase(FollowWorkshopParameters(workshopId: event.workshopId , context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            followWorkshopState: RequestState.error,
            followWorkshopMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                followWorkshopState: RequestState.loaded,
                followWorkshop: r,
              ))
      );
    } else {
      emit(state.copyWith(
        followWorkshopState: RequestState.error,
        followWorkshopMessage: "An error occurred while logging in.",
      ));
    }
  }
  //here i should put the toggle bottom in the _postFollowProfile but i won't call it because there is not backEnd so i do the toggle function

  void _toggleFollowBottom(ToggleFollowBottomEvent event, Emitter<WorkshopProfileState> emit) {
    emit(state.copyWith(isFollowed: !state.isFollowed));
  }

  void _putFollowBottomValue(PutFollowBottomValueEvent event, Emitter<WorkshopProfileState> emit) {
    emit(state.copyWith(isFollowed: event.isWorkshopFollowed));
  }

}