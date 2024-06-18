import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/home/domain/entities/category.dart';
import 'package:mehna_tech/home/domain/repository/base_home_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<List<Categories> , ContextParameters>{

  final BaseHomeRepository baseHomeRepository;

  GetCategoriesUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<Categories>>> call(ContextParameters parameters) async{
    return await baseHomeRepository.getCategories();
  }

}