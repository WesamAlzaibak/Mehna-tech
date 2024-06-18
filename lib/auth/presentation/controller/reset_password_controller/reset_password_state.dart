
import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.forgetPassword,
    this.forgetPasswordState = RequestState.loading,
    this.forgetPasswordMessage = '',
    this.resetPassword,
    this.resetPasswordState = RequestState.loading,
    this.resetPasswordMessage = '',
    this.isPasswordVisible1 = false,
    this.isPasswordVisible2 = false,
  });
  final bool isPasswordVisible1;
  final bool isPasswordVisible2;
  final NoEntities? forgetPassword;
  final RequestState forgetPasswordState;
  final String forgetPasswordMessage;
  final NoEntities? resetPassword;
  final RequestState resetPasswordState;
  final String resetPasswordMessage;

  ResetPasswordState copyWith({
    NoEntities? forgetPassword,
    RequestState? forgetPasswordState,
    String? forgetPasswordMessage,
    NoEntities? resetPassword,
    RequestState? resetPasswordState,
    String? resetPasswordMessage,
    bool? isPasswordVisible1,
    bool? isPasswordVisible2,
  }) {
    return ResetPasswordState(
      forgetPassword: forgetPassword ?? this.forgetPassword,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      forgetPasswordMessage: forgetPasswordMessage ?? this.forgetPasswordMessage,
      resetPassword: resetPassword ?? this.resetPassword,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordMessage: resetPasswordMessage ?? this.resetPasswordMessage,
      isPasswordVisible1: isPasswordVisible1 ?? this.isPasswordVisible1,
      isPasswordVisible2: isPasswordVisible2 ?? this.isPasswordVisible2,
    );
  }

  @override
  List<Object?> get props =>
      [
        forgetPassword,
        forgetPasswordState,
        forgetPasswordMessage,
        resetPassword,
        resetPasswordState,
        resetPasswordMessage,
        isPasswordVisible1,
        isPasswordVisible2,
      ];

}