import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/workshop_profile/domain/repository/base_workshop_profile_repository.dart';

class PostFollowWorkshopUseCase extends BaseUseCase<NoEntities , FollowWorkshopParameters>{

  final BaseWorkshopProfileRepository baseWorkshopProfileRepository;

  PostFollowWorkshopUseCase(this.baseWorkshopProfileRepository);

  @override
  Future<Either<Failure, NoEntities>> call(FollowWorkshopParameters parameters) async{
    return await baseWorkshopProfileRepository.postFollowWorkshop(parameters);
  }
}

class FollowWorkshopParameters extends Equatable{

  final int workshopId;
  final BuildContext context;

  const FollowWorkshopParameters({
    required this.workshopId,
    required this.context,
  });

  @override
  List<Object?> get props => [workshopId,context];
}