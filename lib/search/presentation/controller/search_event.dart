import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SearchEvent extends Equatable{
  const SearchEvent();
}

class GetCategoryWorkshopsEvent extends SearchEvent{
  final int categoryId;
  final BuildContext context;
  const GetCategoryWorkshopsEvent({
    required this.categoryId,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,context];
}

class GetSearchResultEvent extends SearchEvent{
  final String search;
  final BuildContext context;
  const GetSearchResultEvent({
    required this.search,
    required this.context,
  });

  @override
  List<Object?> get props => [search,context];
}
