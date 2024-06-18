import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/auth/domain/entities/Login.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';

class PostLoginUseCase extends BaseUseCase<Login , LoginParameters>{

  final BaseAuthRepository baseAuthRepository;

  PostLoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async{
    return await baseAuthRepository.postLoginInf(parameters);
  }

}

class LoginParameters extends Equatable{

  final String email;
  final String password;
  final BuildContext context;

  const LoginParameters({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [
    email,
    password,
    context,
  ];
}