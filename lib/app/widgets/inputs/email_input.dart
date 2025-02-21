import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.textEditingController,
    this.helperText = '',
    this.border,
    this.width,
  });

  final String helperText;
  final TextEditingController textEditingController;
  final InputBorder? border;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.email,
          style: Styles.titleFieldStyle,
        ),
        SizedBox(
          width: width ?? Get.width - 40,
          child: TextFormField(
            style: Styles.fieldStyle,
            decoration: InputDecoration(
              helperText: helperText,
              hintText: AppLocalizations.of(context)!.email_hint,
              errorStyle: Styles.errorStyle,
              enabledBorder: Styles().borderTextField,
              focusedBorder: Styles().borderTextField,
              errorBorder: Styles().borderTextField,
              focusedErrorBorder: Styles().borderTextField,
              hintStyle: Styles().hintStyle,
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
