import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({super.key});

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: const MyCricularButton(),
        centerTitle: true,
        title: const MyTitleText(
          text: 'Help Center',
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextFild(
              text: '',
              hinttext: 'Tap to search faq',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: MyTitleText(
                text: 'See Other Category',
                fontSize: 20,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromARGB(31, 159, 154, 154),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/insurance.png',
                          fit: BoxFit.cover,
                        ),
                        const Gap(6),
                        const MyTitleText(
                          text: 'Insurance',
                          fontSize: 19,
                        ),
                      ],
                    ),
                    const Divider(),
                    const MyTitleText(
                      text: 'Tracky insurance terms',
                      fontSize: 18,
                    ),
                    const Divider(),
                    const MyTitleText(
                      text: 'Why did the expedition turning around?',
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
