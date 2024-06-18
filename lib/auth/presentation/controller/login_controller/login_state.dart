import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/Login.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class LoginState extends Equatable {

  final bool isPasswordVisible;
  final Login? login;
  final RequestState loginState;
  final String loginMessage;
  const LoginState({
    this.isPasswordVisible = false,
    this.login,
    this.loginState = RequestState.loading,
    this.loginMessage = '',
  });
  LoginState copyWith({
    Login? login,
    RequestState? loginState,
    String? loginMessage,
    bool? isPasswordVisible,
  })
  {
    return LoginState(
      login: login ?? this.login ,
      loginState: loginState  ??  this.loginState ,
      loginMessage: loginMessage  ??  this.loginMessage  ,
      isPasswordVisible: isPasswordVisible  ??  this.isPasswordVisible
    );
  }

  @override
  List<Object?> get props =>[
    login,
    loginState,
    loginMessage,
    isPasswordVisible,
  ];

}