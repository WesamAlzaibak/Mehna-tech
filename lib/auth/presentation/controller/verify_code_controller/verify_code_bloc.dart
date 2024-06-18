import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_event.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_state.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  VerifyCodeBloc(this.postVerifyCodeUseCase) : super(const VerifyCodeState()) {
    on<PostVerifyCodeEvent>(_postVerifyCode);
  }

  final PostVerifyCodeUseCase postVerifyCodeUseCase;

  FutureOr<void> _postVerifyCode(PostVerifyCodeEvent event, Emitter<VerifyCodeState> emit) async {
    final result = await postVerifyCodeUseCase(VerifyParameters(code: event.code, context: event.context, email: event.email,));

    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            verifyCodeState: RequestState.error,
            verifyCodeMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                verifyCodeState: RequestState.loaded,
                verifyCode: r,
              ))
      );
    }
    else {
      emit(state.copyWith(
        verifyCodeState: RequestState.error,
        verifyCodeMessage: "An error occurred while logging in.",
      ));
    }
  }
}