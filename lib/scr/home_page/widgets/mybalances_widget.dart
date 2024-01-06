import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MyBalance extends StatelessWidget {
  final Color? backgroundcolor;
  final Color? fillcolor;
  final Widget? suffixicon;
  final bool assetimage;
  final String? suffixtext;
  final bool subtitle;
  const MyBalance({
    super.key,
    this.backgroundcolor,
    this.fillcolor,
    this.suffixicon,
    required this.assetimage,
    this.suffixtext,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        image: assetimage
            ? const DecorationImage(
                image: AssetImage(
                  'assets/images/balancebackgroundimage.png',
                ),
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        color: backgroundcolor ?? white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySubtitleText(
                  text: 'My Balances',
                ),
                MyTitleText(
                  text: subtitle ? r'$4,875.00' : r'$3.382.00',
                  color: fillcolor,
                ),
              ],
            ),
            Row(
              children: [
                MyTitleText(
                  text: suffixtext ?? 'Top Up',
                  color: fillcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                const Gap(10),
                suffixicon ??
                    SvgPicture.asset(
                      'assets/icons/add.svg',
                      height: 35,
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
