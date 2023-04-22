import 'dart:async';

import 'package:dio/dio.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';
import 'dart:developer' as dev;

abstract class IAuthRepository {
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);
  Future<UserModel?> signUp(String email, String password);
}

class AuthRepository implements IAuthRepository {
  final Dio _dio;
  void _retrieveToken(String accessToken) {
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  AuthRepository(this._dio);
  UserModel? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) {
    return _dio
        .post<Map<String, dynamic>>(ApiKeys.loginDefault,
            data: <String, String>{
              "email": email,
              "password": password,
            },
            options: Options(method: 'POST', contentType: 'application/json'))
        .then<UserModel?>((response) {
      if (response.data == null) return null;

      String accessToken = response.data!['tokens']['access']['token'];
      _retrieveToken(accessToken);

      return UserModel.fromJson(response.data!['user']);
    }, onError: _onError);
  }

  @override
  Future<UserModel?> signUp(String email, String password) {
    return _dio
        .post<Map<String, dynamic>>(
      ApiKeys.register,
      data: <String, dynamic>{
        "email": email,
        "password": password,
        "source": null,
      },
      options: Options(
          method: "POST", contentType: "application/x-www-form-urlencoded"),
    )
        .then(
      (response) {
        if (response.data == null) return null;
        dev.log(response.data == null ? 'null' : response.data.toString());
        return UserModel.fromJson(response.data!['user']);
      },
      onError: _onError,
    );
  }
}
