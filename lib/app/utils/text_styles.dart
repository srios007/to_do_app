import 'package:flutter/material.dart';

import 'palette.dart';

class Styles {
  factory Styles() {
    return _instance;
  }

  Styles._internal();
  static final Styles _instance = Styles._internal();

  static const TextStyle tittleRegister =  TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
   static const TextStyle errorStyle = TextStyle(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );
   static const TextStyle requiredRegister = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
   static const TextStyle hintTextStyleRegister = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
  OutlineInputBorder borderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Palette.black.withOpacity(0.3)),
  );

  OutlineInputBorder errorBorderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
  );
}
