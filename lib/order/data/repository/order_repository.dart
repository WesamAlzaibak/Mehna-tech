
import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/data/datasource/order_remote_data_source.dart';
import 'package:mehna_tech/order/domain/entities/City.dart';
import 'package:mehna_tech/order/domain/entities/Place.dart';
import 'package:mehna_tech/order/domain/entities/Service.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';

class OrderRepository extends BaseOrderRepository{
  final BaseOrderRemoteDataSource baseOrderRemoteDataSource;

  OrderRepository(this.baseOrderRemoteDataSource);

  @override
  Future<Either<Failure, NoEntities>> postOrder(OrderParameters parameters) async {
    try {
      final result = await baseOrderRemoteDataSource.postOrder(parameters);
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
  Future<Either<Failure, List<Services>>> getServices(ServicesParameters parameters) async {
    try {
      final result = await baseOrderRemoteDataSource.getServices(parameters);
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
  Future<Either<Failure, List<City>>> getCities(ContextParameters parameters) async {
    try {
      final result = await baseOrderRemoteDataSource.getCities(parameters);
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
  Future<Either<Failure, List<Place>>> getPlaces(PlacesParameters parameters) async {
    try {
      final result = await baseOrderRemoteDataSource.getPlaces(parameters);
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