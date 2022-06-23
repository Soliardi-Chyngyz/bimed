import 'package:flutter/material.dart';

import '../extenstions/custom_view.dart';

class CustomTextEdit extends StatelessWidget {
  const CustomTextEdit(
      {this.hint = '',
      this.label = '',
      required this.onChangeCallBack,
      this.focusNode,
      this.onFieldSubmitted,
      this.minLines,
      this.maxLines = 1,
      this.icon,
      this.radius = 16,
      this.initValue,
      this.availablePoints = 0,
        this.isNoValidate = false,
      this.autovalidateMode,
      this.textInputType = TextInputType.name,
      Key? key})
      : super(key: key);
  final Function(String) onChangeCallBack;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? onFieldSubmitted;
  final TextInputType textInputType;
  final String label;
  final Widget? icon;
  final int? maxLines;
  final int? minLines;
  final double radius;
  final String? initValue;
  final int availablePoints;
  final AutovalidateMode? autovalidateMode;
  final bool isNoValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: CommonStyle.textFieldStyle(
          labelTextStr: label, icon: icon, radius: radius, hintTextStr: hint),
      autocorrect: false,
      maxLines: maxLines,
      minLines: minLines,
      autovalidateMode: autovalidateMode,
      initialValue: initValue,
      onChanged: (v) => onChangeCallBack(v),
      focusNode: focusNode,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(onFieldSubmitted),
      autofocus: true,
      validator: (value) {
        if (isNoValidate) return null;

        if (availablePoints > 0) {
          if (value != null && value.isNotEmpty) {
            if (int.parse(value) > availablePoints) {
              return 'max';
            }
          } else {
            return null;
          }
        }

        if (value == null || value.isEmpty) return hint;

        return null; // null - no error!
      },
      onSaved: (value) => onChangeCallBack(value ?? ''),
    );
  }
}
