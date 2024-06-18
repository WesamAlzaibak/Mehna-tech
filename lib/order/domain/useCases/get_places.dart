import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/domain/entities/Place.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';

class GetPlacesUseCase extends BaseUseCase<List<Place> , PlacesParameters>{

  final BaseOrderRepository baseOrderRepository;

  GetPlacesUseCase(this.baseOrderRepository);

  @override
  Future<Either<Failure, List<Place>>> call(PlacesParameters parameters) async{
    return await baseOrderRepository.getPlaces(parameters);
  }
}

class PlacesParameters extends Equatable{

  final int cityId;
  final BuildContext context;

  const PlacesParameters({
    required this.cityId,
    required this.context,
  });

  @override
  List<Object?> get props => [cityId,context];
}