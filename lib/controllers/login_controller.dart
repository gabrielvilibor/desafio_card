import 'package:desafio_card/services/do_login.dart';

class LoginController {
  Future<bool> login(String email, String pass) async {
    try {
      var isLogged = await LoginService().postLogin(email, pass);
      return isLogged;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String name, String email, String pass) async {
    try {
      var isRegistered = await LoginService().postRegister(name, email, pass);
      return isRegistered;
    } catch (e) {
      return false;
    }
  }
}
