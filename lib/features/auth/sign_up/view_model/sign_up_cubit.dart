import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:marketi/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository repository;

  SignUpCubit(this.repository) : super(SignUpInitial());

  Future<void> registerUser(SignUpRequest request) async {
    emit(SignUpLoading());

    try {
      final token = await repository.signUp(request);
      if (token != null) {
        emit(SignUpSuccess(token));
      } else {
        emit(SignUpFailure('Sign up failed'));
      }
    } catch (e) {
      emit(SignUpFailure('An error occurred'));
    }
  }
}
