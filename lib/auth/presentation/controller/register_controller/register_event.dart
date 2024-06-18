import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
class TogglePasswordVisibilityEvent1 extends RegisterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TogglePasswordVisibilityEvent2 extends RegisterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostRegisterEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final BuildContext context;

  const PostRegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.context,
  });

  @override
  List<Object?> get props => [firstName,lastName,email, password,confirmPassword,phone,context];
}
