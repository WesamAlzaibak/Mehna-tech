import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';

class PostForgetPasswordUseCase extends BaseUseCase<NoEntities , ForgetParameters>{

  final BaseAuthRepository baseAuthRepository;

  PostForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, NoEntities>> call(ForgetParameters parameters) async{
    return await baseAuthRepository.postForgetPassword(parameters);
  }

}

class ForgetParameters extends Equatable{

  final String email;

  const ForgetParameters({
    required this.email,
  });

  @override
  List<Object?> get props => [email,];
}