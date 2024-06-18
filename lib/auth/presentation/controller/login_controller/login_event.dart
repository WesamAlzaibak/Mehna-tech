import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class TogglePasswordVisibilityEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class PostLoginEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const PostLoginEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [email, password,context];
}