import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_event.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_state.dart';
import 'package:mehna_tech/core/utils/enums.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.postLoginUseCase) : super(const LoginState()) {
    on<PostLoginEvent>(_postLogin);
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibility);
  }

  final PostLoginUseCase postLoginUseCase;

  FutureOr<void> _postLogin(PostLoginEvent event, Emitter<LoginState> emit) async {
    final result = await postLoginUseCase(LoginParameters(email: event.email, password: event.password,context:event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
              emit(state.copyWith(
                loginState: RequestState.error,
                loginMessage: l.message,
              )),
              (r) =>
              emit(state.copyWith(
                loginState: RequestState.loaded,
                login: r,
              ))
      );
    } else {
      emit(state.copyWith(
        loginState: RequestState.error,
        loginMessage: "An error occurred while logging in.",
      ));
    }
  }

  void _togglePasswordVisibility(TogglePasswordVisibilityEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

}