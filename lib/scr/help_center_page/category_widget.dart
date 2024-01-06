import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/help_center_page/insurance_page.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HelpCenterCategoryWidget extends StatelessWidget {
  final bool? ischakk;
  const HelpCenterCategoryWidget({
    super.key,
    this.ischakk,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: MediaQuery.of(context).size.height / 14,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemBuilder: (contex, index) {
            return HelpCenterContainer(
              ischeck: null,
              ontap: () {
                index == 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => const InsurancePage(),
                        ),
                      )
                    : null;
              },
              text: text.elementAt(index),
              imagepath: imagepathh.elementAt(index),
            );
          }),
    );
  }
}

class HelpCenterContainer extends StatelessWidget {
  final String text;
  final String imagepath;
  final void Function()? ontap;
  final bool? svg;
  final bool? doubleinfinity;
  final Color? sideColor;
  final bool? ischeck;
  const HelpCenterContainer({
    super.key,
    required this.text,
    required this.imagepath,
    this.ontap,
    this.svg,
    this.doubleinfinity,
    this.sideColor,
    this.ischeck,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        child: InkWell(
          child: Container(
            height: doubleinfinity == true ? 60 : 40,
            width: doubleinfinity == true ? double.infinity : 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: svg == true
                      ? SvgPicture.asset('assets/icons/$imagepath.svg')
                      : Image.asset(
                          'assets/icons/$imagepath.png',
                          fit: BoxFit.cover,
                        ),
                ),
                const Gap(5),
                Expanded(
                  child: MyTitleText(
                    text: text,
                    fontSize: 16,
                  ),
                ),
                ischeck == true
                    ? const Icon(Icons.check_sharp)
                    : const Icon(
                        Icons.chevron_right_sharp,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> text = ['Insurance', 'App Guide', 'Track', 'Check Rates'];
List<String> imagepathh = ['insurance', 'mobile', 'dimension', 'dollar'];
