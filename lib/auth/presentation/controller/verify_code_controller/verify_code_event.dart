import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class VerifyCodeEvent extends Equatable {
  const VerifyCodeEvent();
}

class PostVerifyCodeEvent extends VerifyCodeEvent {
  final String email;
  final String code;
  final BuildContext context;

  const PostVerifyCodeEvent({
    required this.email,
    required this.code,
    required this.context,
  });

  @override
  List<Object?> get props => [email,code,context];
}
