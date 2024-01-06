import 'package:flutter/material.dart';

class MyCricularButton extends StatelessWidget {
  final Color? bordersidecolor;
  final Color? backgroundcolor;
  final Widget? icon;
  const MyCricularButton({
    super.key,
    this.bordersidecolor,
    this.backgroundcolor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Align(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: bordersidecolor ?? Colors.black12,
                ),
              ),
            ),
            Align(
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: backgroundcolor ?? Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
