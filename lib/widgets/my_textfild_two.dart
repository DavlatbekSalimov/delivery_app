import 'package:catchy/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class MyTextFildTwo extends StatelessWidget {
  final Widget? icon;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final Color? color;
  final String? text;
  final TextEditingController? controller;
  const MyTextFildTwo({
    super.key,
    this.icon,
    this.prefixicon,
    this.suffixicon,
    this.color,
    this.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // maxLines: 1,
      controller: controller,
      cursorColor: color2,
      decoration: InputDecoration(
        filled: true,
        fillColor: color ?? color2,
        hintText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        icon: icon,
        suffixIcon: suffixicon,
        prefixIcon: prefixicon,
      ),
    );
  }
}
