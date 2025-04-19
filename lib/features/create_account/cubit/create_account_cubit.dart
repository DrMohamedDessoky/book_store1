import 'package:bookia/features/create_account/data/repo/create_account_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());
  createAccount({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(CreateAccountLoading());
    final response = await CreateAccountRepo.creatAccount(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    if (response is DioException || response == null) {
      emit(CreateAccountError());
    } else {
      saveUserToken(response["data"]["token"]);
      debugPrint("token is ${response["data"]["token"]}");
      
      emit(CreateAccountSuccess());
    }
  }

  void saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    debugPrint(" pref token is $token");
  }
}
