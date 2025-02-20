import 'package:flutter/material.dart';

import 'utils.dart';

class BorderStyles {
  factory BorderStyles() {
    return _instance;
  }

  BorderStyles._internal();
  static final BorderStyles _instance = BorderStyles._internal();

  InputDecoration inputDecorationGlobal = InputDecoration(
    border: Styles().borderTextField,
    errorStyle: Styles().errorStyle,
    enabledBorder: Styles().borderTextField,
    disabledBorder: Styles().borderTextField,
    focusedBorder: Styles().borderTextField,
    errorBorder: Styles().errorBorderTextField,
    focusedErrorBorder: Styles().errorBorderTextField,
    suffixIconColor: Palette.black,
  );
}
