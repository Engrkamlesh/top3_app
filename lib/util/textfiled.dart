// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

TextFormField buildTextField(String title, 
    String? Function(String?)? textvalidate, bool onPasswordhide, var keytype) {
  bool showpassword = false;
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: keytype,
    obscureText: onPasswordhide ? showpassword : false,
    cursorWidth: 3,
    validator: textvalidate,
    decoration: InputDecoration(
        suffixIcon: onPasswordhide
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.visibility_off,
                  color:Colors.black54,
                ),
              )
            : null,
        label: Text(
          title.toString(),
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black12),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)
        ),
  ));
}
