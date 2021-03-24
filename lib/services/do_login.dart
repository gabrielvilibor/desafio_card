import 'dart:convert';

import 'package:dio/dio.dart';

const base_url = 'https://api-cards-growdev.herokuapp.com';
var user = {};

Future<bool> postLogin(String email, String pass) async {
  try {
    final response = await Dio()
        .post('$base_url/login', data: {"email": email, "password": pass});

    user = response.data;
    print(user);
    return response.statusCode == 200 ? true : false;
  } catch (e) {
    print(e);
    return false;
  }
}

class Login {
  bool doLogin({
    required String email,
    required String pass,
  }) {
    return true;
  }
}

//  growdev@growdev.com
//  growdev@2020