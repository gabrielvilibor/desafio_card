import 'package:desafio_card/controllers/login_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:desafio_card/main.dart';
import 'package:desafio_card/services/do_login.dart';
import 'package:desafio_card/widgets/input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isLoading = false;
  var manterConectado = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  String? email  = 'growdev@growdev.com';
  String? pass = 'growdev@2020';

  void doLogin(ctx) async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState?.save();


    final isLogged = await LoginController().login(email!, pass!);

    if (!isLogged) {
      showFailureLogin();
      return;
    }

    Navigator.of(context).pushReplacementNamed('/home');
  }

  void showFailureLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Usuário ou senha inválidos, Tente novamente',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulGrowdev.shade900,
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: Colors.black38,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                // color: azulGrowdev.shade900,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                  ),
                  BoxShadow(
                    color: azulGrowdev.shade900,
                    spreadRadius: -12.0,
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          color: Colors.white,
                          fit: BoxFit.contain,
                          image: AssetImage("assets/logo-dark.png"),
                          filterQuality: FilterQuality.high,
                          height: 150,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Novo por aqui? ',
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Crie sua conta!',
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 16,
                                        color: laranjaGrowdev,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        buildInput(
                          icon: Icons.email,
                          label: 'E-mail',
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return 'E-mail inválido';
                            }

                            return null;
                          },
                          onSaved: (value) => email = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildInput(
                          icon: Icons.lock,
                          label: 'Password',
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Senha inválida';
                            }

                            return null;
                          },
                          onSaved: (value) => pass = value,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration:
                                  BoxDecoration(color: Colors.blueGrey[600]),
                              child: IconButton(
                                icon: Icon(
                                  manterConectado ? Icons.check : null,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    manterConectado = !manterConectado;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Mantenha-me conectado',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Builder(builder: (ctx) {
                              return ElevatedButton(
                                onPressed: isLoading ? null : () => doLogin(ctx),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  primary: Color.fromRGBO(225, 110, 14, 1),
                                ),
                                child: isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Entrar',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
