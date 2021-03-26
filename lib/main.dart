import 'package:desafio_card/views/card/card_form_page.dart';
import 'package:desafio_card/views/register_page.dart';
import 'package:desafio_card/views/home_page.dart';
import 'package:desafio_card/views/login.dart';
import 'package:flutter/material.dart';

Color laranjaGrowdev = Color.fromRGBO(225, 110, 14, 1);
MaterialColor azulGrowdev = MaterialColor(
  Color.fromRGBO(0, 18, 50, 1).value,
  {
    50: Color.fromRGBO(43, 56, 91, .1),
    100: Color.fromRGBO(43, 56, 91, .2),
    200: Color.fromRGBO(43, 56, 91, .3),
    300: Color.fromRGBO(43, 56, 91, .4),
    400: Color.fromRGBO(43, 56, 91, .5),
    500: Color.fromRGBO(43, 56, 91, .6),
    600: Color.fromRGBO(43, 56, 91, .7),
    700: Color.fromRGBO(43, 56, 91, .8),
    800: Color.fromRGBO(43, 56, 91, .9),
    900: Color.fromRGBO(43, 56, 91, 1),
  },
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Card - GrowDev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/register': (_) => RegisterPage(),
      },
    );
  }
}
