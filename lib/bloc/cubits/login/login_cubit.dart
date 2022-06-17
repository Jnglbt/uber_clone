import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/repositories.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<String> signinWithCredentials() async {
    // if (!(state.isValid || state.status == LoginStatus.submitting)) {
    //   return 'ok';
    // }
    try {
      var user = await _authRepository.signIn(
          email: state.email, password: state.password);

      // print('Sign in user ' + user.toString());

      emit(
        state.copyWith(
          status: LoginStatus.success,
          user: user,
        ),
      );
      return 'ok';
    } catch (e) {
      return e.toString();
    }
  }
}
