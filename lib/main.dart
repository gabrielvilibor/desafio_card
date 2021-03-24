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
      title: 'Desafio Card - GrowDev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (_) => MyHomePage(title: 'Desafio Card'),
        '/login': (_) => LoginPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
