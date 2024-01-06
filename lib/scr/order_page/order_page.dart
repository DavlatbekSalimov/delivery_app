// ignore_for_file: prefer_const_constructors

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/order_page/order_details.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OrederPage extends StatefulWidget {
  const OrederPage({super.key});

  @override
  State<OrederPage> createState() => _OrederPageState();
}

class _OrederPageState extends State<OrederPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: white,
        leading: const MyCricularButton(),
        title: const MyTitleText(
          text: 'Sender Details',
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              MyTextFild(
                text: 'Full Name',
                hinttext: 'Enter your name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/person.svg'),
                ),
                isactiveIcon: Image.asset(
                  'assets/icons/personactiv.png',
                ),
              ),
              MyTextFild(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/call.svg'),
                ),
                isactiveIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/callactiv.png',
                    fit: BoxFit.fill,
                  ),
                ),
                text: 'Phone Number',
                hinttext: 'Enter your number',
              ),
              MyTextFild(
                prefixIcon: const Icon(
                  Icons.place_outlined,
                  size: 30,
                  color: Colors.black26,
                ),
                isactiveIcon: Icon(
                  Icons.place_rounded,
                  size: 30,
                  color: color2,
                ),
                text: 'City / Province',
                hinttext: 'Enter your city, province',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  // alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTitleText(
                        text: 'Detail Location',
                        fontSize: 20,
                      ),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText:
                              "Type detailed location to make it easier for us to pick up the package",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(MediaQuery.of(context).size.height * 0.16),
              MyElevatedButton(
                text: 'Continue',
                width: MediaQuery.of(context).size.height * 0.15,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => OrderDetailsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
