import 'package:flutter/material.dart';

Button(Function() function, String text) {
  return OutlinedButton(
      child: Text(text, style: TextStyle(fontSize: 22, letterSpacing: .6, color: Colors.white, fontWeight: FontWeight.bold),),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
        side: BorderSide(color: Color.fromRGBO(225, 110, 14, 1), width: 1),
        backgroundColor: Color.fromRGBO(225, 110, 14, 1),
      ),
      onPressed: function);
}