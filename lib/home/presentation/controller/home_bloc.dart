import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/home/domain/useCases/get_categories.dart';
import 'package:mehna_tech/home/domain/useCases/get_home_posts.dart';
import 'package:mehna_tech/home/domain/useCases/get_promote_posts.dart';
import 'package:mehna_tech/home/presentation/controller/home_events.dart';
import 'package:mehna_tech/home/presentation/controller/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.getHomePostsUseCase,this.getCategoriesUseCase,this.getPromotePostsUseCase) : super(const HomeState()) {
    on<GetHomePostsEvent>(_getHomePosts);
    on<GetCategoriesEvent>(_getCategories);
    on<GetPromotePostsEvent>(_getPromotePosts);
    on<ToggleCurrentIndexNumberEvent>(_toggleCurrentIndexNumber);
  }
  final GetHomePostsUseCase getHomePostsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetPromotePostsUseCase getPromotePostsUseCase;

  FutureOr<void> _getHomePosts(GetHomePostsEvent event, Emitter<HomeState> emit) async {
    final result = await getHomePostsUseCase(ContextParameters(context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            homePostsState: RequestState.error,
            homePostsMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                homePostsState: RequestState.loaded,
                homePosts: r,
              ))
      );
    } else {
      emit(state.copyWith(
        homePostsState: RequestState.error,
        homePostsMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getCategories(GetCategoriesEvent event, Emitter<HomeState> emit) async {
    final result = await getCategoriesUseCase(ContextParameters(context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            categoriesState: RequestState.error,
            categoriesMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                categoriesState: RequestState.loaded,
                categories: r,
              ))
      );
    } else {
      emit(state.copyWith(
        promotePostsState: RequestState.error,
        promotePostsMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getPromotePosts(GetPromotePostsEvent event, Emitter<HomeState> emit) async {
    final result = await getPromotePostsUseCase(ContextParameters(context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            promotePostsState: RequestState.error,
            promotePostsMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                promotePostsState: RequestState.loaded,
                promotePosts: r,
              ))
      );
    } else {
      emit(state.copyWith(
        promotePostsState: RequestState.error,
        promotePostsMessage: "An error occurred while logging in.",
      ));
    }
  }

  void _toggleCurrentIndexNumber(ToggleCurrentIndexNumberEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentIndex: event.newCurrentIndex));
  }
}












