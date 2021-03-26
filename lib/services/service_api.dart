import 'dart:convert';

import 'package:desafio_card/models/card_model.dart';
import 'package:dio/dio.dart';

class ServiceApi {
  var base_url = 'https://api-cards-growdev.herokuapp.com';

  Future<List<Cards>?> getCards() async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      String access_token = await getToken();

      var headers = {"Authorization": "Bearer " + access_token};

      var response =
          await dio.get('/cards', options: Options(headers: headers));
      var teste = (response.data as List).map((e) => Cards.fromMap(e)).toList();
      return response.statusCode == 200 || response.statusCode == 201
          ? (response.data as List).map((e) => Cards.fromMap(e)).toList()
          : null;
    } catch (e) {
      return null;
    }
  }

  Future<String> getToken() async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));
      String email = "growdev@growdev.com";
      String pass = "growdev@2020";
      var response =
          await dio.post('/login', data: {"email": email, "password": pass});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['token'];
      }
      return 'Erro ao buscar o token - ${response.statusCode}';
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> deleteCard(int id) async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      String access_token = await getToken();

      var headers = {"Authorization": "Bearer " + access_token};

      var response =
          await dio.delete('/cards/$id', options: Options(headers: headers));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createCard(String title, String content) async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      String access_token = await getToken();

      var headers = {"Authorization": "Bearer " + access_token};

      var response = await dio.post('/cards',
          options: Options(headers: headers),
          data: {"title": title, "content": content});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editCard(int id, String title, String content) async {
    try {
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      String access_token = await getToken();

      var headers = {"Authorization": "Bearer " + access_token};

      var response = await dio.put('/cards/$id',
          options: Options(headers: headers),
          data: {"title": title, "content": content});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
