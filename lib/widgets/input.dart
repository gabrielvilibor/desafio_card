import 'package:flutter/material.dart';

var showPass = false;

StatefulWidget buildInput({
  required String label,
  required String? Function(String?) validator,
  required void Function(String?) onSaved,
  IconData? icon,
  TextEditingController? controller,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText && !showPass,
    validator: validator,
    onSaved: onSaved,
    decoration: InputDecoration(
      contentPadding:
          new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      fillColor: Colors.blueGrey[600],
      filled: true,
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      suffixIcon: obscureText
          ? IconButton(
              icon: Icon(
                showPass ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54,
              ),
              onPressed: () {
                // setState(() {
                showPass = !showPass;
                // });
              },
            )
          : Icon(
              icon,
              color: Colors.black54,
            ),
    ),
    style: TextStyle(
      color: Colors.white,
    ),
    cursorColor: Colors.white,
    cursorWidth: 3,
    cursorRadius: Radius.circular(10),
    keyboardType: TextInputType.text,
  );
}
