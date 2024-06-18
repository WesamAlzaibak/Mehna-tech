import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';

class PostOrderUseCase extends BaseUseCase<NoEntities , OrderParameters>{

  final BaseOrderRepository baseOrderRepository;

  PostOrderUseCase(this.baseOrderRepository);

  @override
  Future<Either<Failure, NoEntities>> call(OrderParameters parameters) async{
    return await baseOrderRepository.postOrder(parameters);
  }
}

class OrderParameters extends Equatable{

  final int categoryId;
  final int workshopId;
  final List<int> servicesIds;
  final String orderDescription;
  final List<String> orderPhotos;
  final BuildContext context;

  const OrderParameters({
    required this.categoryId,
    required this.workshopId,
    required this.servicesIds,
    required this.orderDescription,
    required this.orderPhotos,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,workshopId,servicesIds,orderDescription,orderPhotos,context];
}