import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class VerifyCodeState extends Equatable {
  const VerifyCodeState({
    this.verifyCode,
    this.verifyCodeState = RequestState.loading,
    this.verifyCodeMessage = '',
  });

  final NoEntities? verifyCode;
  final RequestState verifyCodeState;
  final String verifyCodeMessage;

  VerifyCodeState copyWith({
    NoEntities? verifyCode,
    RequestState? verifyCodeState,
    String? verifyCodeMessage,
  }) {
    return VerifyCodeState(
      verifyCode: verifyCode ?? this.verifyCode,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      verifyCodeMessage: verifyCodeMessage ?? this.verifyCodeMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        verifyCode,
        verifyCodeState,
        verifyCodeMessage,
      ];

}