import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';

abstract class BaseWorkshopProfileRepository{

  Future <Either<Failure,WorkshopProfile>> getWorkshopProfile(WorkshopProfileParameters parameters);

  Future <Either<Failure,List<Post>>> getWorkshopPosts(WorkshopProfileParameters parameters);

  Future <Either<Failure,NoEntities>> postFollowWorkshop(FollowWorkshopParameters parameters);

}