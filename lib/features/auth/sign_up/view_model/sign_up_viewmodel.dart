import 'package:flutter/material.dart';
import 'package:marketi/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:marketi/features/auth/sign_up/data/repo/sign_uo_repo.dart';



class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  bool isLoading = false;

  Future<void> registerUser(SignUpRequest request, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final token = await _authRepository.signUp(request);

    isLoading = false;
    notifyListeners();

    if (token != null) {
      // ممكن تخزنيه في SharedPreferences مثلاً
      print('Registration successful. Token: $token');
      // navigate to home or login screen
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }
}
