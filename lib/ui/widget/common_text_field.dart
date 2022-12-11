import 'package:flutter/material.dart';

enum TextFieldType {
  labourCount,
  address,
  selectTime,
  startDate,
  endDate,
  selectShift,
}

class CustomTextField extends StatelessWidget {
  final TextFieldType textFieldType;
  final Widget? clearTextWidget;
  final void Function()? onTab;
  const CustomTextField({
    Key? key,
    this.onTab,
    required this.textFieldType,
    this.clearTextWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      readOnly: readOnly,
      onTap: onTab,
      decoration: InputDecoration(
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.all(17),
        //filled: true,
        // fillColor: Colors.black54,
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }

  bool get readOnly {
    switch (textFieldType) {
      case TextFieldType.selectTime:
      case TextFieldType.selectShift:
        return true;
      default:
        return false;
    }
  }

  InputBorder get border {
    switch (textFieldType) {
      case TextFieldType.address:
      case TextFieldType.labourCount:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26),
        );
      default:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26),
        );
    }
  }

  TextInputType? get textInputType {
    switch (textFieldType) {
      case TextFieldType.startDate:
        return TextInputType.number;
      case TextFieldType.endDate:
        return TextInputType.number;
    }
    return null;
  }

  TextInputAction? get textInputAction {
    switch (textFieldType) {
      case TextFieldType.startDate:
      case TextFieldType.selectTime:
        return TextInputAction.next;
      default:
        return null;
    }
  }

  Widget? get prefix {
    switch (textFieldType) {
      case TextFieldType.labourCount:
        return const Icon(
          Icons.account_circle,
          color: Colors.black54,
        );
      case TextFieldType.address:
        return const Icon(
          Icons.home,
          color: Colors.black54,
        );
      default:
        return null;
    }
  }

  Widget? get suffix {
    switch (textFieldType) {
      case TextFieldType.selectTime:
        return const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black);
      case TextFieldType.selectShift:
        return const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black26,
        );
      default:
        return null;
    }
  }

  String? get hintText {
    switch (textFieldType) {
      case TextFieldType.labourCount:
        return "Labour Count";
      case TextFieldType.address:
        return "Address";
      case TextFieldType.selectTime:
        return "Select Start Time";
      case TextFieldType.startDate:
        return "Enter Start Date";
      case TextFieldType.endDate:
        return "Select End Time";
      case TextFieldType.selectShift:
        return "Select Shift";
      default:
        return null;
    }
  }
}
