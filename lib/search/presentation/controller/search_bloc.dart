import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';
import 'package:mehna_tech/search/presentation/controller/search_event.dart';
import 'package:mehna_tech/search/presentation/controller/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.getCategoryWorkshopsUseCase,this.getSearchResultUseCase,) : super(const SearchState()) {
    on<GetCategoryWorkshopsEvent>(_getCategoryWorkshops);
    on<GetSearchResultEvent>(_getSearchResult);
  }

  final GetCategoryWorkshopsUseCase getCategoryWorkshopsUseCase;
  final GetSearchResultUseCase getSearchResultUseCase;

  FutureOr<void> _getCategoryWorkshops(GetCategoryWorkshopsEvent event, Emitter<SearchState> emit) async {
    final result = await getCategoryWorkshopsUseCase(CategoryFilterParameters(categoryId: event.categoryId,context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            categoryWorkshopsState: RequestState.error,
            categoryWorkshopsMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                categoryWorkshopsState: RequestState.loaded,
                categoryWorkshops: r,
              ))
      );
    } else {
      emit(state.copyWith(
        categoryWorkshopsState: RequestState.error,
        categoryWorkshopsMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getSearchResult(GetSearchResultEvent event, Emitter<SearchState> emit) async {
    final result = await getSearchResultUseCase(SearchParameters(search: event.search,context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            searchResultState: RequestState.error,
            searchResultMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                searchResultState: RequestState.loaded,
                searchResult: r,
              ))
      );
    } else {
      emit(state.copyWith(
        searchResultState: RequestState.error,
        searchResultMessage: "An error occurred while logging in.",
      ));
    }
  }
}