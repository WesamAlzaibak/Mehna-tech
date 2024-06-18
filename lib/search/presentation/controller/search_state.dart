import 'package:equatable/equatable.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';

class SearchState extends Equatable{
  final List<Search> categoryWorkshops;
  final RequestState categoryWorkshopsState;
  final String categoryWorkshopsMessage;
  final List<Search> searchResult;
  final RequestState searchResultState;
  final String searchResultMessage;
  const SearchState({
    this.categoryWorkshops = const [],
    this.categoryWorkshopsState = RequestState.loaded,
    this.categoryWorkshopsMessage = "",
    this.searchResult = const [],
    this.searchResultState = RequestState.loaded,
    this.searchResultMessage = "",
    //I make it loaded by default just because i work with static data
    //it is should be loading by default
  });
  SearchState copyWith({
    List<Search>? categoryWorkshops,
    RequestState? categoryWorkshopsState,
    String? categoryWorkshopsMessage,
    List<Search>? searchResult,
    RequestState? searchResultState,
    String? searchResultMessage,
  }){
    return SearchState(
      categoryWorkshops: categoryWorkshops ?? this.categoryWorkshops ,
      categoryWorkshopsState: categoryWorkshopsState  ??  this.categoryWorkshopsState ,
      categoryWorkshopsMessage: categoryWorkshopsMessage  ??  this.categoryWorkshopsMessage  ,
      searchResult: searchResult ?? this.searchResult ,
      searchResultState: searchResultState  ??  this.searchResultState ,
      searchResultMessage: searchResultMessage  ??  this.searchResultMessage ,
    );
  }

  @override
  List<Object> get props => [
    categoryWorkshops,
    categoryWorkshopsState,
    categoryWorkshopsMessage,
    searchResult,
    searchResultState,
    searchResultMessage,
  ];

}