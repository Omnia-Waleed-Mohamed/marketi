// lib/features/auth/login/view_model/login_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:marketi/features/auth/login/data/model/login_model.dart';
import 'package:marketi/features/auth/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> loginUser(LoginRequest request) async {
    emit(LoginLoading());

    try {
      final token = await loginRepository.login(request);
      if (token != null) {
        emit(LoginSuccess(token));
      } else {
        emit(LoginFailure("Login failed: Token not received"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
