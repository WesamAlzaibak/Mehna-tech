import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';
import 'package:mehna_tech/workshop_profile/domain/repository/base_workshop_profile_repository.dart';

class GetWorkshopProfileUseCase extends BaseUseCase<WorkshopProfile , WorkshopProfileParameters>{

  final BaseWorkshopProfileRepository baseWorkshopProfileRepository;

  GetWorkshopProfileUseCase(this.baseWorkshopProfileRepository);

  @override
  Future<Either<Failure, WorkshopProfile>> call(WorkshopProfileParameters parameters) async{
    return await baseWorkshopProfileRepository.getWorkshopProfile(parameters);
  }
}

class WorkshopProfileParameters extends Equatable{

  final int workshopId;
  final BuildContext context;

  const WorkshopProfileParameters({
    required this.workshopId,
    required this.context,
  });

  @override
  List<Object?> get props => [workshopId,context];
}