import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/home/domain/entities/promote_posts.dart';
import 'package:mehna_tech/home/domain/repository/base_home_repository.dart';

class GetPromotePostsUseCase extends BaseUseCase<List<PromotePosts> , ContextParameters>{

  final BaseHomeRepository baseHomeRepository;

  GetPromotePostsUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<PromotePosts>>> call(ContextParameters parameters) async{
    return await baseHomeRepository.getPromotePosts();
  }

}