import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/domain/entities/City.dart';
import 'package:mehna_tech/order/domain/entities/Place.dart';
import 'package:mehna_tech/order/domain/entities/Service.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';

abstract class BaseOrderRepository{
  Future <Either<Failure,NoEntities>> postOrder(OrderParameters parameters);

  Future <Either<Failure,List<Services>>> getServices(ServicesParameters parameters);

  Future <Either<Failure,List<City>>> getCities(ContextParameters parameters);

  Future <Either<Failure,List<Place>>> getPlaces(PlacesParameters parameters);

}