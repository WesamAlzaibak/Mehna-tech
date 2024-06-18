import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/search/data/datasource/search_remote_data_source.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';
import 'package:mehna_tech/search/domain/repository/base_search_repository.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';

class SearchRepository extends BaseSearchRepository{
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepository(this.baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, List<Search>>> getCategoryWorkshops(CategoryFilterParameters parameters) async {
    try {
      final result = await baseSearchRemoteDataSource.getCategoryWorkshops(parameters);
      if (result != null) {
        return Right(result);
      } else {
        return const Left(ServerFailure("Result is null"));
      }
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> getSearchResult(SearchParameters parameters) async{
    try{
      final result = await baseSearchRemoteDataSource.getSearchResult(parameters);
      if (result != null) {
        return Right(result);
      } else {
        return const Left(ServerFailure("Result is null"));
      }
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.errorMessage));
    }
  }
}