import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';
import 'package:mehna_tech/search/domain/repository/base_search_repository.dart';

class GetCategoryWorkshopsUseCase extends BaseUseCase<List<Search> , CategoryFilterParameters>{

  final BaseSearchRepository baseSearchRepository;

  GetCategoryWorkshopsUseCase(this.baseSearchRepository);

  @override
  Future<Either<Failure, List<Search>>> call(CategoryFilterParameters parameters) async{
    return await baseSearchRepository.getCategoryWorkshops(parameters);
  }

}

class CategoryFilterParameters extends Equatable{

  final int categoryId;
  final BuildContext context;

  const CategoryFilterParameters({
    required this.categoryId,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,context];
}