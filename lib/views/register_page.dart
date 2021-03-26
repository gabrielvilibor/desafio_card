import 'package:desafio_card/controllers/login_controller.dart';
import 'package:desafio_card/widgets/alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:desafio_card/main.dart';
import 'package:desafio_card/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isLoading = false;
  var manterConectado = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? pass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void doRegister(ctx) async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState?.save();

    final isRegistered = await LoginController().register(name!, email!, pass!);

    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Inicializa o shared preferences
    prefs.setString('name', name!); // cria uma chave no cache do app
    prefs.setString('email', email!); // cria uma chave no cache do app
    prefs.setString('password', pass!);

    if (!isRegistered) {
      showFailureRegister();
      return;
    }
    alert(
        context,
        'Conta criada com sucesso! Voce será redirecionado para a pagina de login.',
        true,
        route:
            '/login'); // criei uma prop no alert que recebe a rota, o ideal seria fazer
    // validação pra saber se existe esse argumento ou não, mas todos alertas apontam pra alguma rota.
  }

  void showFailureRegister() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Não foi possível criar sua conta',
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
                        buildInput(
                          icon: Icons.person,
                          label: 'Nome',
                          validator: (value) {
                            if (value!.length < 3) {
                              return 'Digite um nome válido';
                            }

                            return null;
                          },
                          onSaved: (value) => name = value,
                        ),
                        SizedBox(
                          height: 20,
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
                          label: 'Senha',
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
                          height: 20,
                        ),
                        Align(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Builder(builder: (ctx) {
                              return ElevatedButton(
                                onPressed:
                                    isLoading ? null : () => doRegister(ctx),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  primary: Color.fromRGBO(225, 110, 14, 1),
                                ),
                                child: isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Criar conta',
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
