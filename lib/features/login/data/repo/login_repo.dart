import 'package:bookia/core/sevices/network_services/a_p_is.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  static Dio? _dio;
  static login({required String email, required String password}) async {
    _dio = Dio(
      BaseOptions(
        baseUrl: APIs.baseUrl,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
    try {
      final response = await _dio?.post(
        "login",
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200) {
        return response?.data;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
