import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/widget/texts.dart';

class MkInputField extends StatelessWidget {
  const MkInputField({
    Key? key,
    this.controller,
    this.currentNode,
    this.label,
    this.hint,
    this.nextNode,
    this.isPassword = false,
    this.autoValidate = false,
    this.errorText,
    this.onChanged,
    this.validator,
    this.borderColor,
    this.onsaved,
    this.keyboard,
    this.initialValue,
    this.copy = false,
    this.isEnabled = true,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines = 1,
    this.showHint = true,
    this.suffixIcon,
    this.prefixIcon,
    this.isForgottenOption = false,
    this.inputFormatters,
    this.textFieldLabel = true,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final String? errorText;
  final bool? isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onsaved;
  final TextInputType? keyboard;
  final bool? isEnabled;
  final bool? copy;
  final bool? autoValidate;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final dynamic onFieldSubmitted;
  final int? maxLines;
  final bool? showHint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isForgottenOption;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final bool textFieldLabel;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!textFieldLabel)
          NormalText(
           label,
            weight: FontWeight.w500,
            size:15,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          enabled: isEnabled,
          initialValue: initialValue,
          keyboardType: keyboard,
          obscureText: isPassword!,
          onChanged: onChanged,
          validator: validator,
          focusNode: currentNode,
          onSaved: (String? value) {
            FocusScope.of(context).requestFocus(nextNode);
            onsaved!(value!);
          },
          onFieldSubmitted: (String value) {
            FocusScope.of(context).requestFocus(nextNode);
            onFieldSubmitted(value);
          },
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffE1E4E8)),
              borderRadius: BorderRadius.circular(18),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffE1E4E8)),
              borderRadius: BorderRadius.circular(18),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffE1E4E8).withOpacity(0.3)),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffE1E4E8)),
              borderRadius: BorderRadius.circular(18),
            ),
            labelText: textFieldLabel ? label : null,
            hintText: hint,
            hintStyle: TextStyle(
              color: appColors.greyFBFCFC,
              fontSize: 16,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
class PasswordValidator {
  static String? validate(String? val) {
    Pattern pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*(),.?":{}|<>])';
    RegExp regex = RegExp(pattern as String);

    if (val == null || val.isEmpty) {
      return "Enter a password";
    } else if (val.length < 6) {
      return "Password is too weak\n"
          "Password can contain:\n"
          "- Capital letter (A-Z)\n"
          "- Numbers (0-9)\n"
          "- Special characters (!@#\$%^&*)";
    } else if (!regex.hasMatch(val)) {
      return "Password can contain:\n"
          "- Capital letter (A-Z)\n"
          "- Numbers (0-9)\n"
          "- Special characters (!@#\$%^&*)";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) {
      return "Please confirm your password";
    } else if (val != password) {
      return "Passwords do not match";
    }
    return null;
  }
}


class EmailValidator {
  static String? validate(String? val) {
    if (!val!.contains("@") || !val.contains(".")) {
      return "Enter a valid Email address";
    } else if (val.isEmpty) {
      return "Enter your Email address";
    } else {
      return null;
    }
  }
}

class AnyInputValidator {
  static String? emptyValidate(String? val, {String? inputName}) {
    if (val!.isEmpty) {
      return "Enter ${inputName ?? 'Details'}";
    } else {
      return null;
    }
  }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  CurrencyPtBrInputFormatter({this.maxDigits});
  final int? maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (maxDigits != null && newValue.selection.baseOffset > maxDigits!) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##", "en_US");
    String newText = "\$ " + formatter.format(value / 100);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
