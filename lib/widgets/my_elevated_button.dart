// ignore_for_file: sort_child_properties_last

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyElevatedButton extends StatefulWidget {
  const MyElevatedButton(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.sideColor,
      this.widgett,
      this.onPressed,
      this.fontsize,
      this.width,
      this.buildContext})
      : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? sideColor;
  final Widget? widgett;
  final double? fontsize;
  final double? width;
  final BuildContext? buildContext;
  final void Function()? onPressed;

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Row(
        children: [
          if (widget.widgett != null) ...[
            widget.widgett!,
            const Gap(5),
          ],
          MyTitleText(
            text: widget.text,
            fontSize: widget.fontsize ?? 19,
            fontWeight: FontWeight.w500,
            color: widget.textColor ?? Colors.white,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: widget.sideColor ?? color2),
        backgroundColor: widget.backgroundColor ?? color2,
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: widget.width ?? MediaQuery.of(context).size.width * 0.29,
        ),
      ),
    );
  }
}
