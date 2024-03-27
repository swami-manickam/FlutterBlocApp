import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? validator;
  final bool obsecure;
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomTextField(
      {required this.validator,
      required this.hintText,
      required this.obsecure,
      required this.controller,
      this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          /*if (value!.isEmpty) {
            return validator;
          } else if (value.length < 0) {
            return "Password must be greater than 6 letters";
          }*/
          if (value == null || value.isEmpty) {
            print('Empty value detected for $hintText');
            return validator ?? 'This field cannot be empty';
          }
          return null;
        },
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: secondaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: ratingStarColor)),
            fillColor: secondaryTextColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: whiteColor, fontSize: 13.0)),
      ),
    );
  }
}
