// lib/features/auth/login/data/repo/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:marketi/features/auth/login/data/model/login_model.dart';


class LoginRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://marketi-app.onrender.com/api/v1'));

Future<String?> login(LoginRequest request) async {
  try {
    final response = await _dio.post('/auth/signIn', data: request.toJson());

    if (response.statusCode == 200) {
      print("LOG IN RESPONSE: ${response.data}");

      
      if (response.data['token'] != null) {
        return response.data['token'];
      } else {
        print("Token not found in response: ${response.data}");
        return null;
      }
    } else {
      print("Unexpected response: ${response.data}");
      return null;
    }
  } on DioException catch (e) {
    print("Login error: ${e.response?.data ?? e.message}");

    throw Exception(e.response?.data['message'] ?? 'Unknown error');
  }
}


}
