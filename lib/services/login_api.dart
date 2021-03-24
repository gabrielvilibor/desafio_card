import 'package:dio/dio.dart';

class LoginApi{

  static Future<bool> login(String email, String pass) async{
    try{
      var urlBase = 'https://api-cards-growdev.herokuapp.com';
      var dio = Dio(BaseOptions(baseUrl: urlBase, connectTimeout: 10000));

      var body = {
        "email": email,
        "password": pass
      };

      var response = await dio.post('/login', data: body);

      if(response.statusCode == 200 || response.statusCode == 201){
        print(response);
        return true;
      }
      return false;
    }catch(e){
      return false;
    }
  }
}