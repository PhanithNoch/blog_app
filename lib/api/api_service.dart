import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

import '../models/login_res_model.dart';
import '../models/register_res_model.dart';

class APIService {
  Future<Either<String, LoginResModel>> login(
      String email, String password) async {
    try {
      var response = await Dio().post('http://127.0.0.1:8000/api/login',
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return Right(LoginResModel.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(
        e.toString(),
      );
    }
  }

  ///register user
  Future<Either<String, RegisterResModel>> register(
      String email, String name, String password) async {
    try {
      var response = await Dio().post(
        'http://127.0.0.1:8000/api/register',
        data: {
          'email': email,
          'name': name,
          'password': password,
          'password_confirmation': password
        },
      );
      if (response.statusCode == 200) {
        return Right(RegisterResModel.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(
        e.toString(),
      );
    }
  }
}
