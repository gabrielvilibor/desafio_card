import 'dart:convert';

import 'package:desafio_card/models/usuario_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  var base_url = 'https://api-cards-growdev.herokuapp.com';

  Future<bool> postLogin(String email, String pass) async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      final response = await dio.post(
          '/login', data: {"email": email, "password": pass});

      if(response.statusCode == 200 || response.statusCode == 201){ // coloquei o if para fazer a deuparação dos dados e salvar na classe usuario
        Usuario u = Usuario.fromJson(response.data['user']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', u.name.toString());
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

/*class Login {
  bool doLogin({
    required String email,
    required String pass,
  }) {
    return true;
  }
}*/

//  growdev@growdev.com
//  growdev@2020