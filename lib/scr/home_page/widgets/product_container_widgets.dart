import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final Widget? prefixicon;
  final Widget? suffixicon;
  final String? sufixtext;
  final Color? sufixcolor;
  final String? titletext;
  final String? subtitletext;
  final Color? sidecolor;
  final double? sufixtextsize;
  const ProductContainer({
    super.key,
    this.prefixicon,
    this.sufixtext,
    this.titletext,
    this.subtitletext,
    this.sufixcolor,
    this.suffixicon,
    this.sidecolor,
    this.sufixtextsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: sidecolor ?? Colors.black26,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefixicon ??
                Image.asset(
                  'assets/images/containericon.png',
                ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyTitleText(
                  text: titletext ?? 'MM09132005',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                MySubtitleText(
                  text: subtitletext ?? 'Processed at sort facility',
                  fontSize: 18,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: suffixicon ??
                MyTitleText(
                    text: sufixtext ?? '2 Hrs',
                    color:
                        sufixcolor ?? const Color.fromARGB(255, 137, 142, 180),
                    fontSize: sufixtextsize ?? 20,
                    fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
