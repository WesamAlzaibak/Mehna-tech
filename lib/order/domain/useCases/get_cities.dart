import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/order/domain/entities/City.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';

class GetCitiesUseCase extends BaseUseCase<List<City> , ContextParameters>{

  final BaseOrderRepository baseOrderRepository;

  GetCitiesUseCase(this.baseOrderRepository);

  @override
  Future<Either<Failure, List<City>>> call(ContextParameters parameters) async{
    return await baseOrderRepository.getCities(parameters);
  }

}