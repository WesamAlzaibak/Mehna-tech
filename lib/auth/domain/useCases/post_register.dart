import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';

class PostRegisterUseCase extends BaseUseCase<NoEntities , RegisterParameters>{

  final BaseAuthRepository baseAuthRepository;

  PostRegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, NoEntities>> call(RegisterParameters parameters) async{
    return await baseAuthRepository.postRegister(parameters);
  }

}

class RegisterParameters extends Equatable{
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final BuildContext context;

  const RegisterParameters({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.context,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    confirmPassword,
    phone,
    context,
  ];
}