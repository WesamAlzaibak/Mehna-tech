import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/domain/repository/base_workshop_profile_repository.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';

class GetWorkshopPostsUseCase extends BaseUseCase<List<Post> , WorkshopProfileParameters>{

  final BaseWorkshopProfileRepository baseWorkshopProfileRepository;

  GetWorkshopPostsUseCase(this.baseWorkshopProfileRepository);

  @override
  Future<Either<Failure, List<Post>>> call(WorkshopProfileParameters parameters) async{
    return await baseWorkshopProfileRepository.getWorkshopPosts(parameters);
  }
}