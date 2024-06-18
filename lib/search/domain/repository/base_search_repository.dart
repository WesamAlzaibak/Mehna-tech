import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';

abstract class BaseSearchRepository{

  Future <Either<Failure,List<Search>>> getCategoryWorkshops(CategoryFilterParameters parameters);

  Future <Either<Failure,List<Search>>> getSearchResult(SearchParameters parameters);

}