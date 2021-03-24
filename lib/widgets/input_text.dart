import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  String label;
  TextInputType? keyboardType;
  TextEditingController controller;
  FormFieldValidator<String>? validator;
  bool password;
  int? maxLines;
  FocusNode? myFocusNode;
  Color? color;

  InputText(this.label, this.controller, {this.validator, this. keyboardType, this.password = false, this.color, this.myFocusNode, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: this.maxLines,
      obscureText: password,
      controller: controller,
      validator: validator,
      focusNode: myFocusNode,
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: this.color ?? Colors.red)
          ),
          labelText: label,
          hintText: label,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: this.color),
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: this.color)),
          style: TextStyle(fontSize: 18, color: this.color),
          textAlign: TextAlign.left,
    );
  }
}
