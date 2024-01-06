import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/customer_service_page/customer_service_page.dart';
import 'package:catchy/scr/help_center_page/category_widget.dart';
import 'package:catchy/scr/help_center_page/popular_searched_widgets.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
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
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: MyTitleText(
                  text: 'Category',
                  fontSize: 20,
                ),
              ),
              const HelpCenterCategoryWidget(),
              const MyTitleText(
                text: 'Popular Searched',
                fontSize: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PopularSearchedWidgets(
                        text: text.elementAt(index),
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: MyTitleText(
                  text: 'Contact Customer Service',
                  fontSize: 20,
                ),
              ),
              MyElevatedButton(
                widgett: SvgPicture.asset('assets/icons/whatsapp.svg'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => const CustomerServicerPage(),
                    ),
                  );
                },
                width: 60,
                text: 'Contact Via Whatsapp',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MyElevatedButton(
                  widgett: SvgPicture.asset('assets/icons/nmessage.svg'),
                  width: 60,
                  onPressed: () {},
                  backgroundColor: white,
                  text: 'Contact Via Email',
                  textColor: black,
                  sideColor: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> text = [
  'Why my track is not showing',
  'Tracky insurance terms',
  'How to place order',
  'How to do track',
];
