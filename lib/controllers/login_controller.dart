import 'package:desafio_card/models/usuario_model.dart';
import 'package:desafio_card/services/do_login.dart';

class LoginController{


  Future<bool> login(String email, String pass) async{
    try{
      var isLogged = await LoginService().postLogin(email, pass);
      return isLogged;
    }catch(e){
      return false;
    }
  }


}