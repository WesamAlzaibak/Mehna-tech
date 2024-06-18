import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';

class PostVerifyCodeUseCase extends BaseUseCase<NoEntities , VerifyParameters>{

  final BaseAuthRepository baseAuthRepository;

  PostVerifyCodeUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, NoEntities>> call(VerifyParameters parameters) async{
    return await baseAuthRepository.postVerifyCode(parameters);
  }
}

class VerifyParameters extends Equatable{

  final String email;
  final String code;
  final BuildContext context;

  const VerifyParameters({
    required this.email,
    required this.code,
    required this.context,
  });

  @override
  List<Object?> get props => [email,code,context];
}