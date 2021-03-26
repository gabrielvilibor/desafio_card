import 'package:flutter/material.dart';

alert(BuildContext context, String msg, bool tipoResposta) {
  // recebe parametros para estourar alerta em tela
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          backgroundColor: !tipoResposta ? Colors.red : Colors.greenAccent,
          title: Text(msg),
          actions: <Widget>[
            OutlinedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            )
          ],
        ),
      );
    },
  );
}
