import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/widgets/my_bottom_nav.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPaymentMethod extends StatefulWidget {
  final bool topupimage;
  const MyPaymentMethod({
    super.key,
    required this.topupimage,
  });

  @override
  State<MyPaymentMethod> createState() => _MyPaymentMethodState();
}

class _MyPaymentMethodState extends State<MyPaymentMethod> {
  bool isactive1 = true;
  bool isactive2 = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTitleText(
              text: 'Payment Method',
              fontSize: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isactive1 = !isactive1;
                            isactive2 = !isactive2;
                          });
                        },
                        child: ProductContainer(
                          prefixicon: index == 0
                              ? SvgPicture.asset('assets/icons/cardicon.svg')
                              : Stack(
                                  children: [
                                    Align(
                                      child: Icon(
                                        Icons.circle,
                                        color: color2,
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(0, -0.2),
                                      child: SvgPicture.asset(
                                          'assets/icons/circleaddicon.svg'),
                                    ),
                                  ],
                                ),
                          sidecolor: index == 0 && isactive1
                              ? black
                              : index == 1 && isactive2
                                  ? black
                                  : Colors.black26,
                          titletext: index == 0
                              ? 'Mastercard'
                              : 'Add New Payment Method',
                          suffixicon: index == 0 && isactive1
                              ? const Icon(
                                  Icons.stop_circle_sharp,
                                  color: Colors.black,
                                )
                              : index == 1 && isactive2
                                  ? const Icon(
                                      Icons.stop_circle_sharp,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.circle_outlined,
                                      color: Colors.black26,
                                    ),
                          subtitletext: index == 0 ? '6895 3526 8456 ****' : '',
                        ),
                      ),
                    );
                  }),
            ),
            MyElevatedButton(
              text: 'Confirm Payment',
              width: MediaQuery.of(context).size.width * 0.25,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contex) {
                    return SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            widget.topupimage
                                ? 'assets/images/topup.png'
                                : 'assets/images/success.jpg',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const Align(
                            alignment: Alignment(0, 0.3),
                            child: MyTitleText(text: 'Top Up Successfully'),
                          ),
                          const Align(
                            alignment: Alignment(0, 0.5),
                            child: MySubtitleText(
                              text:
                                  'Congratulation! your balance already added,and please check your balance.',
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.8),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              child: MyElevatedButton(
                                  width: 100,
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contex) =>
                                              const MyBottomNav(),
                                        ),
                                        (route) => false);
                                  },
                                  text: 'Go to Homepage'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
