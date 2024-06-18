import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/data/datasource/auth_remote_data_source.dart';
import 'package:mehna_tech/auth/domain/entities/Login.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/error/failure.dart';

class AuthRepository extends BaseAuthRepository{
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, Login>> postLoginInf(LoginParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.postLogin(parameters);

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
  Future<Either<Failure, NoEntities>> postRegister(RegisterParameters parameters) async{
    try{
    final result = await baseAuthRemoteDataSource.postRegister(parameters);

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
  Future<Either<Failure, NoEntities>> postVerifyCode(VerifyParameters parameters) async{
   try{
     final result = await baseAuthRemoteDataSource.postVerifyCode(parameters);

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
  Future<Either<Failure, NoEntities>> postResetPassword(ResetParameters parameters) async{
    try{
      final result = await baseAuthRemoteDataSource.postResetPassword(parameters);
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
  Future<Either<Failure, NoEntities>> postForgetPassword(ForgetParameters parameters) async{
    try{
      final result = await baseAuthRemoteDataSource.postForgetPassword(parameters);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        return Right(result);
      } else {
        return const Left(ServerFailure("Result is null")); // Handle the case where result is null
      }
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.errorMessage));
    }
  }

}