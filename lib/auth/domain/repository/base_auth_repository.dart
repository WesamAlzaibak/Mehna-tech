import 'package:dartz/dartz.dart';
import 'package:mehna_tech/auth/domain/entities/Login.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/core/error/failure.dart';

abstract class BaseAuthRepository{
  Future <Either<Failure,Login>> postLoginInf(LoginParameters parameters);

  Future <Either<Failure,NoEntities>> postRegister(RegisterParameters parameters);

  Future <Either<Failure,NoEntities>> postVerifyCode(VerifyParameters parameters);

  Future <Either<Failure,NoEntities>> postResetPassword(ResetParameters parameters);

  Future <Either<Failure,NoEntities>> postForgetPassword(ForgetParameters parameters);
}