import 'package:bookia/features/login/data/repo/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await LoginRepo.login(email: email, password: password);
    if (response is DioException || response == null) {
      emit(LoginError());
    } else {
      saveUserToken(response["data"]["token"]);
      emit(LoginSuccess());
    }
  }

  void saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
