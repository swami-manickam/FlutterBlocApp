import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String btnLabel;
  final bool loading;

  const CustomButton(
      {required this.loading,
      required this.onTap,
      required this.btnLabel,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 55,
        decoration: BoxDecoration(
          color: btnBbColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.black54,
                  )
                : Text(
                    btnLabel,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
