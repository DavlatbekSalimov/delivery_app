import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/help_center_page/category_widget.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool ischack = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const MyCricularButton(),
        title: const MyTitleText(
          text: 'Language',
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            MyTextFild(
              isactiveIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/searchnoactiv.svg',
                ),
              ),
              text: '',
              hinttext: 'Search language',
            ),
            const Gap(10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: HelpCenterContainer(
                        sideColor: black,
                        ontap: () {
                          setState(() {
                            if (ischack) {}
                            ischack = !ischack;
                          });
                        },
                        ischeck: ischack,
                        text: 'English',
                        imagepath: 'flag${index + 1}',
                        doubleinfinity: true,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
