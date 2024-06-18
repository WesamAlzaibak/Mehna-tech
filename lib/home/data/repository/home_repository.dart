import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/home/data/datasource/home_remote_data_source.dart';
import 'package:mehna_tech/home/domain/entities/category.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/domain/entities/promote_posts.dart';
import 'package:mehna_tech/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository{
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getHomePosts() async {
    try {
      final result = await baseHomeRemoteDataSource.getHomePosts();

      // ignore: unnecessary_null_comparison
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
  Future<Either<Failure, List<PromotePosts>>> getPromotePosts() async {
    try {
      final result = await baseHomeRemoteDataSource.getPromotePosts();

      // ignore: unnecessary_null_comparison
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
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      final result = await baseHomeRemoteDataSource.getCategories();
      // ignore: unnecessary_null_comparison
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