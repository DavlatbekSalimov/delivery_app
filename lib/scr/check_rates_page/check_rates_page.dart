// ignore_for_file: sort_child_properties_last

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_line_container.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CheckRatesPage extends StatefulWidget {
  const CheckRatesPage({super.key});

  @override
  State<CheckRatesPage> createState() => _CheckRatesPageState();
}

class _CheckRatesPageState extends State<CheckRatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const MyCricularButton(),
        title: const MyTitleText(
          text: 'Check Rates',
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 14, top: 24),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.06,
                  left: 16,
                  child: SvgPicture.asset(
                    'assets/icons/verticalline.svg',
                    height: 55,
                  ),
                ),
                Column(
                  children: [
                    MyTextFildTwo(
                      icon: SvgPicture.asset(
                        'assets/icons/check.svg',
                        height: 34,
                      ),
                      text: 'Pick up Location',
                      color: white,
                      suffixicon: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset('assets/icons/location.svg'),
                      ),
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.04),
                    MyTextFildTwo(
                      icon: SvgPicture.asset(
                        'assets/icons/map.svg',
                        height: 34,
                      ),
                      text: 'Package Destination',
                      color: white,
                      suffixicon: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset('assets/icons/location.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(28),
            SizedBox(
              child: MyTextFild(
                text: 'Dimension',
                hinttext: '0',
                isactiveIcon: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/icons/cubsearchactive.jpg',
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/cubsearch.svg'),
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MyTitleText(
                    text: 'Kg',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Gap(
              MediaQuery.of(context).size.height * 0.05,
            ),
            MyElevatedButton(
              text: '         Check',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contex) {
                    return Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        child: Column(
                          children: [
                            const LineContainer(),
                            const Gap(20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTitleText(
                                      text: '1254 Kanata,\nOttawa',
                                      fontSize: 20,
                                    ),
                                    MySubtitleText(text: 'Picked Up')
                                  ],
                                ),
                                Icon(
                                  Icons.sync_alt_rounded,
                                  size: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTitleText(
                                      text: '2541  Orleans,\nToronto',
                                      fontSize: 20,
                                    ),
                                    MySubtitleText(text: 'Destionation')
                                  ],
                                ),
                              ],
                            ),
                            const Divider(),
                            ProductContainer(
                              titletext: 'Regular',
                              subtitletext: '2 - 3 Days',
                              sufixtext: r'$15',
                              sufixcolor: black,
                            ),
                            ProductContainer(
                              prefixicon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/cargo.png'),
                              ),
                              titletext: 'Cargo',
                              subtitletext: '3 - 6 Days',
                              sufixtext: r'$31',
                              sufixcolor: black,
                            ),
                            ProductContainer(
                              titletext: 'Express',
                              subtitletext: '',
                              prefixicon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Image.asset('assets/images/carexpress.png'),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
