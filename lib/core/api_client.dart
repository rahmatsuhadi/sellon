import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sellon/core/auth.dart';
import 'package:sellon/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio _dio = Dio();
  final url = dotenv.env['APP_URL'];

  Future registerUser() async {
    //IMPLEMENT USER REGISTRATION
  }

  Future login(String email, String password) async {
    try {
      Response response = await _dio
          .post('$url/api/login', data: {'email': email, 'password': password});
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    List<CategoryModel> categories = [];
    final token = await Auth().getToken();
    final response = await http.get(
        Uri.parse(
          '$url/api/categories',
        ),
        headers: {"Authorization": 'Bearer $token'});
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);

      categories = (it as List).map((e) => CategoryModel.fromJson(e)).toList();
    }

    return categories;
  }

  // Future<Response> getUserProfileData() async {
  //     //GET USER PROFILE DATA
  // }

  // Future<Response> logout() async {
  //     //IMPLEMENT USER LOGOUT
  //  }
}
