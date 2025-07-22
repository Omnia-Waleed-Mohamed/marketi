// lib/features/auth/login/view_model/login_view_model.dart
import 'package:flutter/material.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/features/auth/login/data/model/login_model.dart';
import 'package:marketi/features/auth/login/data/repo/login_repo.dart';


class LoginViewModel extends ChangeNotifier {
  final   LoginRepository _authRepository = LoginRepository();

  bool isLoading = false;

  Future<void> loginUser(LoginRequest request, BuildContext context) async {
  isLoading = true;
  notifyListeners();

  try {
    final token = await _authRepository.login(request);

    isLoading = false;
    notifyListeners();

    if (token != null) {
      print("Login successful. Token: $token");

      Navigator.pushReplacementNamed(context, Routes.home);
    }
  } catch (e) {
    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
    );
  }
}

}
