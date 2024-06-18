import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_event.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_state.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(this.postForgetPasswordUseCase,this.postResetPasswordUseCase) : super(const ResetPasswordState()) {
    on<PostForgetPasswordEvent>(_postForgetPassword);
    on<PostResetPasswordEvent>(_postResetPassword);
    on<TogglePasswordVisibilityEvent1>(_togglePasswordVisibility1);
    on<TogglePasswordVisibilityEvent2>(_togglePasswordVisibility2);
  }
  final PostForgetPasswordUseCase postForgetPasswordUseCase;
  final PostResetPasswordUseCase postResetPasswordUseCase;

  FutureOr<void> _postResetPassword(PostResetPasswordEvent event, Emitter<ResetPasswordState> emit) async{
    final result = await postResetPasswordUseCase(ResetParameters(code:event.code,password:event.password,confirmPassword: event.confirmPassword, context: event.context));
   // ignore: unnecessary_null_comparison
   if(result != null) {
     result.fold((l) =>
         emit(state.copyWith(
           resetPasswordState: RequestState.error,
           resetPasswordMessage: l.message,
         )),
             (r) =>
             emit(state.copyWith(
               resetPasswordState: RequestState.loaded,
               resetPassword: r,
             ))
     );
   }
   else {
     emit(state.copyWith(
       resetPasswordState: RequestState.error,
       resetPasswordMessage: "An error occurred while logging in.",
     ));
   }
  }

  FutureOr<void> _postForgetPassword(PostForgetPasswordEvent event, Emitter<ResetPasswordState> emit) async{
    final result = await postForgetPasswordUseCase(ForgetParameters(email:event.email));
    // ignore: unnecessary_null_comparison
    if(result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            forgetPasswordState: RequestState.error,
            forgetPasswordMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                forgetPasswordState: RequestState.loaded,
                forgetPassword: r,
              ))
      );
    }
    else {
      emit(state.copyWith(
        resetPasswordState: RequestState.error,
        resetPasswordMessage: "An error occurred while logging in.",
      ));
    }
  }

  void _togglePasswordVisibility1(TogglePasswordVisibilityEvent1 event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(isPasswordVisible1: !state.isPasswordVisible1));
  }

  void _togglePasswordVisibility2(TogglePasswordVisibilityEvent2 event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(isPasswordVisible1: !state.isPasswordVisible2));
  }

}