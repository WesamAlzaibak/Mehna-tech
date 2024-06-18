import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';

class PostResetPasswordUseCase extends BaseUseCase<NoEntities , ResetParameters>{

  final BaseAuthRepository baseAuthRepository;

  PostResetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, NoEntities>> call(ResetParameters parameters) async{
    return await baseAuthRepository.postResetPassword(parameters);
  }
}

class ResetParameters extends Equatable{

  final String code;
  final String password;
  final String confirmPassword;
  final BuildContext context;

  const ResetParameters({
    required this.code,
    required this.password,
    required this.confirmPassword,
    required this.context,
  });

  @override
  List<Object?> get props => [code,password,confirmPassword,context];
}