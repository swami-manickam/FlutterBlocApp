import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.isPassword = false,
      required this.keyBoardType,
      this.suffix,
      this.maxLength});
  final String hintText;
  final int? maxLength;

  final bool isPassword;
  final Widget? suffix;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ? isObscure : false,
      keyboardType: widget.keyBoardType,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: redColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: whiteColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 18.sp, color: greyColor),
        filled: true,
        fillColor: whiteColor,
      ),
    );
  }
}
