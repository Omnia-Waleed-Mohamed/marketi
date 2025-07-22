import 'package:flutter/material.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:marketi/features/auth/sign_up/data/repo/sign_up_repo.dart';



class SignUpViewModel extends ChangeNotifier {
  final SignUpRepository _authRepository = SignUpRepository();

  bool isLoading = false;

  Future<void> registerUser(SignUpRequest request, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final token = await _authRepository.signUp(request);

    isLoading = false;
    notifyListeners();

    if (token != null) {
      
      print('Registration successful. Token: $token');
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }
}
