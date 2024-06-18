import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

class TogglePasswordVisibilityEvent1 extends ResetPasswordEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TogglePasswordVisibilityEvent2 extends ResetPasswordEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostResetPasswordEvent extends ResetPasswordEvent {
  final String code;
  final String password;
  final String confirmPassword;
  final BuildContext context;

  const PostResetPasswordEvent({
    required this.code,
    required this.password,
    required this.confirmPassword,
    required this.context
  });

  @override
  List<Object?> get props => [code,password,confirmPassword,context];
}

class PostForgetPasswordEvent extends ResetPasswordEvent {
  final String email;

  const PostForgetPasswordEvent(this.email,);

  @override
  List<Object?> get props => [email];
}