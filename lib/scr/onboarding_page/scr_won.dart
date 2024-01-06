// ignore_for_file: prefer_const_constructors

import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/scr/register/signup_pages/create_account.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gap/gap.dart';

class ScreenWon extends StatefulWidget {
  const ScreenWon({Key? key}) : super(key: key);

  @override
  State<ScreenWon> createState() => _ScreenWonState();
}

class _ScreenWonState extends State<ScreenWon> {
  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const Duration interval = Duration(seconds: 3);
    _timer = Timer.periodic(interval, (Timer timer) {
      setState(() {
        if (currentIndex < 2) {
          currentIndex++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.559,
              width: double.infinity,
              child: Image.asset(
                'assets/images/${imagepath.elementAt(currentIndex)}.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      MyTitleText(
                        text: titletext.elementAt(currentIndex),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.7, vertical: 8),
              child: MySubtitleText(
                text: subtitletext.elementAt(currentIndex),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        (currentIndex == 0) ? Colors.black : Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        (currentIndex == 1) ? Colors.black : Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        (currentIndex == 2) ? Colors.black : Colors.black12,
                  ),
                ),
              ],
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyElevatedButton(
                text: 'Create Account',
                textColor: Colors.white,
                //! create a new account
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => CreateAccount(
                        phoneNumber: '',
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyElevatedButton(
                text: 'Sign In as Guest',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                sideColor: Colors.black26,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> imagepath = ['onbwon', 'onbtwo', 'onbthree'];
List<String> titletext = [
  'Cash on Delivery or E-payment',
  'Delivery Right to Your Door Step',
  'Welcome to Tracky'
];
List<String> subtitletext = [
  'Our delivery will ensure your items are delivered right to the door steps',
  'Our delivery will ensure your items are delivered right to the door steps',
  'Tracky is the best solution to deliver and track goods from local and world shipping.'
];
