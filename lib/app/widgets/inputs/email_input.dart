import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.textEditingController,
    this.helperText = '',
    this.border,
    this.textStyle,
    this.width,
  });

  final String titleText;
  final String hintText;
  final String helperText;
  final TextEditingController textEditingController;
  final InputBorder? border;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            color: Palette.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: width ?? Get.width - 40,
          child: TextFormField(
            style: textStyle,
            decoration: InputDecoration(
              helperText: helperText,
              hintText: hintText,
              errorStyle: Styles.errorStyle,
              enabledBorder: Styles().borderTextField,
              focusedBorder: Styles().borderTextField,
              errorBorder: Styles().borderTextField,
              focusedErrorBorder: Styles().borderTextField,
            ),
            controller: textEditingController,
            validator: (String? _) {
              if (textEditingController.text.isEmpty) {
                return AppLocalizations.of(context)!.please_fill;
              } else if (!GetUtils.isEmail(textEditingController.text)) {
                return AppLocalizations.of(context)!.please_email;
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}
