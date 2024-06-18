import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.isPasswordVisible1 = false,
    this.isPasswordVisible2 = false,
    this.register,
    this.registerState = RequestState.loading,
    this.registerMessage = '',
  });

  final bool isPasswordVisible1;
  final bool isPasswordVisible2;
  final NoEntities? register;
  final RequestState registerState;
  final String registerMessage;

  RegisterState copyWith({
    NoEntities? register,
    RequestState? registerState,
    String? registerMessage,
    bool? isPasswordVisible1,
    bool? isPasswordVisible2
  }) {
    return RegisterState(
        register: register ?? this.register,
        registerState: registerState ?? this.registerState,
        registerMessage: registerMessage ?? this.registerMessage,
        isPasswordVisible1: isPasswordVisible1 ?? this.isPasswordVisible1,
        isPasswordVisible2: isPasswordVisible2 ?? this.isPasswordVisible2,
    );
  }

  @override
  List<Object?> get props =>
      [
        register,
        registerState,
        registerMessage,
        isPasswordVisible1,
        isPasswordVisible2,
      ];

}