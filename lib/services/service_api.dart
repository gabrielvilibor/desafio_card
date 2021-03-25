import 'dart:convert';

import 'package:desafio_card/models/card_model.dart';
import 'package:dio/dio.dart';

class ServiceApi{

  var base_url = 'https://api-cards-growdev.herokuapp.com';
  
  Future<List<Cards>?> getCards() async{
    try{
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));

      String access_token = await getToken();

      var headers = {
        "Authorization": "Bearer " + access_token
      };
      
      var response = await dio.get('/cards', options: Options(
        headers: headers
      ));

      List list = json.decode(response.data);
      var teste = list.map<Cards>((e) => Cards.fromMap(e)).toList();
      print('teste ${teste.length}');
      return response.statusCode == 200 || response.statusCode == 201 ? list.map<Cards>((e) => Cards.fromMap(e)).toList() : null;

    }catch(e){
      return null;
    }
  }

  Future<String> getToken() async{
    try{
      var dio = Dio(BaseOptions(baseUrl: base_url, connectTimeout: 100000));
      String email = "growdev@growdev.com";
      String pass = "growdev@2020";
      var response = await dio.post('/login', data: {"email": email, "password": pass});
      
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data['token'];
      }
      return 'Erro ao buscar o token - ${response.statusCode}';
    }catch(e){
      return e.toString();
    }
  }
}