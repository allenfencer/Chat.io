import 'package:flutter/material.dart';

import '../constants/colors.dart';

class InputField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController editingController;
  final String hintText;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final IconData? hintIcon;
  final FormFieldValidator? formValidator;
  final FormFieldSetter? onFieldSubmitted;
  const InputField({
    Key? key,
    this.obscureText = false,
    this.onChanged,
    required this.editingController,
    required this.hintText,
    required this.textInputType,
    this.hintIcon,
    this.formValidator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColor.primaryColor,
        style: Theme.of(context).textTheme.bodySmall!,
        controller: editingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: hintIcon != null
              ? Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                )
              : null,
          filled: true,
          fillColor: AppColor.greyShade,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColor.backgroundColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.primaryLight, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.greyShade),
          ),
        ),
        validator: formValidator);
  }
}
