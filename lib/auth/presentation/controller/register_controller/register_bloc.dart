import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_event.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_state.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.postRegisterUseCase) : super(const RegisterState()) {
    on<PostRegisterEvent>(_postRegister);
    on<TogglePasswordVisibilityEvent1>(_togglePasswordVisibility1);
    on<TogglePasswordVisibilityEvent2>(_togglePasswordVisibility2);
  }

  final PostRegisterUseCase postRegisterUseCase;

  FutureOr<void> _postRegister(PostRegisterEvent event, Emitter<RegisterState> emit) async {
    final result = await postRegisterUseCase(RegisterParameters(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        phone: event.phone, context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            registerState: RequestState.error,
            registerMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                registerState: RequestState.loaded,
                register: r,
              ))
      );
    } else {
      emit(state.copyWith(
        registerState: RequestState.error,
        registerMessage: "An error occurred while logging in.",
      ));
    }
  }

  void _togglePasswordVisibility1(TogglePasswordVisibilityEvent1 event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordVisible1: !state.isPasswordVisible1));
  }
  void _togglePasswordVisibility2(TogglePasswordVisibilityEvent2 event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordVisible1: !state.isPasswordVisible2));
  }

}
