import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/data/datasource/workshop_profile_remote_data_source.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';
import 'package:mehna_tech/workshop_profile/domain/repository/base_workshop_profile_repository.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';

class WorkshopProfileRepository extends BaseWorkshopProfileRepository{
  final BaseWorkshopProfileRemoteDataSource baseWorkshopProfileRemoteDataSource;

  WorkshopProfileRepository(this.baseWorkshopProfileRemoteDataSource);

  @override
  Future<Either<Failure, WorkshopProfile>> getWorkshopProfile(WorkshopProfileParameters parameters) async {
    try {
      final result = await baseWorkshopProfileRemoteDataSource.getWorkshopProfile(parameters);
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
  Future<Either<Failure, List<Post>>> getWorkshopPosts(WorkshopProfileParameters parameters) async {
    try {
      final result = await baseWorkshopProfileRemoteDataSource.getWorkshopPosts(parameters);
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
  Future<Either<Failure, NoEntities>> postFollowWorkshop(FollowWorkshopParameters parameters) async {
    try {
      final result = await baseWorkshopProfileRemoteDataSource.postFollowWorkshop(parameters);
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