import 'package:dio/dio.dart';
import 'package:marketi/features/auth/sign_up/data/model/sign_up_model.dart';

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://marketi-app.onrender.com/api/v1'));

  Future<String?> signUp(SignUpRequest request) async {
    try {
      final response = await _dio.post('/auth/signUp', data: request.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        // رجّع التوكن لو رجع معاكي
        return response.data['data']['token'];
      } else {
        print('Unexpected response: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      print('SignUp error: ${e.response?.data ?? e.message}');
      return null;
    }
  }
}
