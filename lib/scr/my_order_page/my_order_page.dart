import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/constants/widget/tabbar.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  bool _fromme = true;
  bool _tome = false;
  final int _pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/home.png',
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
                Align(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTitleText(
                              text: 'My Order',
                              color: white,
                            ),
                            Image.asset(
                              'assets/images/orderight.png',
                              height: 50,
                            )
                          ],
                        ),
                        const Gap(19),
                        MyTextFildTwo(
                          text: 'Enter track number',
                          prefixicon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          suffixicon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/scaner.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: RegisterTabBar(
                    leftbackgroundColor:
                        _fromme ? white : const Color(0xFFF8F9FB),
                    rightbackgroundColor:
                        _tome ? white : const Color(0xFFF8F9FB),
                    lefttext: 'From Me',
                    righttext: 'To Me',
                    leftonTap: () {
                      setState(() {
                        _fromme = !_fromme;
                        _tome = !_tome;
                        _pageindex == 0 ? _pageindex + 1 : _pageindex - 1;
                      });
                    },
                    rightonTap: () {
                      setState(() {
                        _fromme = !_fromme;
                        _tome = !_tome;
                        _pageindex == 0 ? _pageindex + 1 : _pageindex - 1;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: index == 0 ? 70 : null,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color:
                                  index == 0 ? const Color(0xFF1D272F) : null,
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: MyTitleText(
                                text: texts.elementAt(index),
                                fontSize: 14,
                                color: index == 0 ? white : Colors.black38,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: MyTitleText(
                    text: ' ${_fromme ? '4' : ' 8'} Results',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: ProductContainer(
                          sufixtextsize: 16,
                          sufixcolor:
                              index == 1 && _fromme == true ? color2 : black,
                          sufixtext: index == 1
                              ? _fromme == true
                                  ? 'Pending'
                                  : 'On Process'
                              : _fromme == true
                                  ? 'Delivered'
                                  : 'On Process',
                          subtitletext: index == 0
                              ? 'On transit area'
                              : index == 1
                                  ? 'Returned to sender'
                                  : 'Waiting to picked up',
                          titletext: index == 0
                              ? 'MM09132005'
                              : index == 1
                                  ? 'MA84561259'
                                  : 'FU84593276',
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> texts = [
  'All',
  'Pending',
  'On Process',
  'Delivered',
];
