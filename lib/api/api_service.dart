import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../models/login_res_model.dart';

class APIService {
  Future<Either<String, LoginResModel>> login(
      String email, String password) async {
    try {
      var response = await Dio().post('http://127.0.0.1:8000/api/login');
      if (response.statusCode == 200) {
        return Right(LoginResModel.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      print(e);
      return Left(
        e.toString(),
      );
    }
  }
}
