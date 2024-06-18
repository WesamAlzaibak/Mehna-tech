import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';
import 'package:mehna_tech/search/domain/repository/base_search_repository.dart';

class GetSearchResultUseCase extends BaseUseCase<List<Search> , SearchParameters>{

  final BaseSearchRepository baseSearchRepository;

  GetSearchResultUseCase(this.baseSearchRepository);

  @override
  Future<Either<Failure, List<Search>>> call(SearchParameters parameters) async{
    return await baseSearchRepository.getSearchResult(parameters);
  }

}

class SearchParameters extends Equatable{

  final String search;
  final BuildContext context;

  const SearchParameters({
    required this.search,
    required this.context,
  });

  @override
  List<Object?> get props => [search,context];
}