import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/domain/entities/Service.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';

class GetServicesUseCase extends BaseUseCase<List<Services> , ServicesParameters>{

  final BaseOrderRepository baseOrderRepository;

  GetServicesUseCase(this.baseOrderRepository);

  @override
  Future<Either<Failure, List<Services>>> call(ServicesParameters parameters) async{
    return await baseOrderRepository.getServices(parameters);
  }
}

class ServicesParameters extends Equatable{

  final int categoryId;
  final BuildContext context;

  const ServicesParameters({
    required this.categoryId,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,context];
}