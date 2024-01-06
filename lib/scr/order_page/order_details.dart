// ignore_for_file: sort_child_properties_last

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_line_container.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:catchy/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final TextEditingController _controller = TextEditingController();
  bool isactive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCricularButton(),
        centerTitle: true,
        title: const MyTitleText(
          text: 'Order Details',
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      width: 200,
                      child: MyTextFild(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/container.svg'),
                        ),
                        isactiveIcon:
                            Image.asset('assets/icons/activcontainer.png'),
                        text: 'Full Name',
                        hinttext: 'Enter package type',
                      ),
                    ),
                  ),
                  const Gap(10),
                  const SizedBox(
                    height: 120,
                    width: 100,
                    child: MyTextFild(
                      text: 'Weight',
                      hinttext: '0',
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyTitleText(
                          text: 'Kg',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.135,
                child: ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (contex, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.29,
                          child: MyTextFild(
                            keyboardType: TextInputType.number,
                            text: index == 0 ? 'Dimension' : '',
                            hinttext: index == 0
                                ? 'Length'
                                : index == 1
                                    ? 'Width'
                                    : 'Height',
                            suffixIcon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: MyTitleText(
                                text: 'Cm',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              MyTextFild(
                controller: _controller,
                onChanged: (text) {},
                isactiveIcon: Image.asset('assets/icons/activcalendar.png'),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/calendar.svg'),
                ),
                text: 'Services',
                hinttext: 'Select Services',
                suffixIcon: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: LineContainer(),
                                  ),
                                  const MyTitleText(
                                    text: 'Services',
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    child: ListView.builder(
                                        itemCount: 3,
                                        itemBuilder: (contex, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                _controller.text = index == 0
                                                    ? 'Regular'
                                                    : index == 1
                                                        ? 'Cargo'
                                                        : 'Express';
                                              },
                                              child: ProductContainer(
                                                prefixicon: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                      'assets/images/cargo.png'),
                                                ),
                                                titletext: index == 0
                                                    ? 'Regular'
                                                    : index == 1
                                                        ? 'Cargo'
                                                        : 'Express',
                                                subtitletext: index == 0
                                                    ? '2 - 3 Days'
                                                    : index == 1
                                                        ? '3 - 6 Days'
                                                        : '1 - 2 Days',
                                                sufixtext:
                                                    '\$${index == 0 ? '15' : index == 1 ? '31' : '42'}',
                                                sufixcolor: black,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.expand_more_outlined,
                    size: 40,
                    color: Colors.black38,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1D272F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.error_outlined,
                      color: color2,
                      size: 30,
                    ),
                    MyTitleText(
                      text:
                          'Weight discrepancies will incur additional \nfees or the goods will be returned',
                      fontSize: 14,
                      color: white,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: MyElevatedButton(
          text: 'Play Now',
          width: MediaQuery.of(context).size.width * 0.34,
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) {
                return const MyPaymentMethod(
                  topupimage: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
