import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class NormalInput extends StatelessWidget {
  const NormalInput({
    super.key,
    this.hintText,
    required this.titleText,
    required this.textEditingController,
    this.helperText = '',
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLines,
  });

  final String? hintText;
  final String helperText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String titleText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - 40,
                child: TextFormField(
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  inputFormatters: inputFormatters ?? [],
                  maxLines: maxLines ?? 1,
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
                  validator: validator ??
                      (String? _) {
                        if (textEditingController.text.isEmpty) {
                          return AppLocalizations.of(context)!.please_fill;
                        } else {
                          return null;
                        }
                      },
                  keyboardType: keyboardType ?? TextInputType.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
