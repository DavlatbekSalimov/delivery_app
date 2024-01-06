import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/features_tables_widget.dart';
import 'package:catchy/scr/home_page/widgets/mybalances_widget.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/scr/notification_page/notification_page.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/home.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 55,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Image.asset('assets/icons/logo3.png'),
                            MyTitleText(
                              text: 'Catchy',
                              fontWeight: FontWeight.w400,
                              color: white,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: color2,
                        radius: 90,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => const NotificationPage(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            const Align(
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.white12,
                              ),
                            ),
                            Positioned(
                              right: 1.6,
                              top: 2,
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: const Color(0xFF1D272F),
                                child: SvgPicture.asset(
                                  'assets/icons/notification.svg',
                                ),
                              ),
                            ),
                            Positioned(
                              right: 15,
                              top: 14,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: color2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      const MyBalance(
                        subtitle: false,
                        assetimage: false,
                      ),
                      const Gap(25),
                      MyTextFildTwo(
                        suffixicon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/scaner.svg',
                          ),
                        ),
                        prefixicon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        text: 'Enter track number',
                      )
                    ],
                  ),
                ),
              ],
            ),
            //! screen
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyTitleText(
                          text: 'Features',
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.33,
                          child: const FeaturesTables(),
                        ),
                        const MyTitleText(
                          text: 'Services and Product',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              itemBuilder: (contex, index) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: ProductContainer(),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
