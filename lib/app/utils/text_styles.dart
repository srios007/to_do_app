import 'package:flutter/material.dart';

import 'palette.dart';

class Styles {
  factory Styles() {
    return _instance;
  }

  Styles._internal();

  static final Styles _instance = Styles._internal();

  static const tittleRegister = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static const errorStyle = TextStyle(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );

  static const requiredRegister = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  static const hintTextStyleRegister = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  final hintStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Palette.black.withOpacity(0.5),
  );

  static const fieldStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Palette.black,
  );

  static const titleFieldStyle = TextStyle(
    color: Palette.mainColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  
  final borderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Palette.black.withOpacity(0.3)),
  );

  final errorBorderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
  );
}
