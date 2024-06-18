import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/domain/repository/base_home_repository.dart';

class GetHomePostsUseCase extends BaseUseCase<List<Post> , ContextParameters>{

  final BaseHomeRepository baseHomeRepository;

  GetHomePostsUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<Post>>> call(ContextParameters parameters) async{
    return await baseHomeRepository.getHomePosts();
  }

}