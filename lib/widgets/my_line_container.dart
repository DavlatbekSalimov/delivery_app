import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  final double? width;
  const LineContainer({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: width ?? 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
    );
  }
}
