import 'package:bookia/core/network_services/a_p_is.dart';
import 'package:dio/dio.dart';

class CreateAccountRepo {
  static Dio? _dio;
  static creatAccount({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
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
        "register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      // debugPrint("response is $response");
      if (response?.statusCode == 201) {
        return response?.data;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
