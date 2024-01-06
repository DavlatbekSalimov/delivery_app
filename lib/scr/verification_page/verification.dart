import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_bottom_nav.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../widgets/my_title_text.dart';

class VerifyAccount extends StatefulWidget {
  final String phoneNumber;
  const VerifyAccount({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  bool isSnackBarShown = false;
  bool isDialogShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTitleText(text: 'Verification Code'),
            const MySubtitleText(text: 'We have sent the code verification to'),
            Row(
              children: [
                const MySubtitleText(text: 'your number'),
                const Gap(10),
                MyTitleText(
                  text: widget.phoneNumber,
                  fontSize: 18,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                cursorHeight: 30,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  selectedFillColor: color2,
                  activeFillColor: color2,
                  selectedColor: color2,
                  shape: PinCodeFieldShape.box,
                  borderWidth: 2,
                  fieldWidth: 50,
                  inactiveColor: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Center(
              child: Countdown(
                seconds: 159, // Adjusted to 2 minutes and 35 seconds
                build: (BuildContext context, double time) {
                  final minutes = (time / 60).floor();
                  final seconds = (time % 60).floor();
                  if (minutes == 2 && seconds == 35 && !isSnackBarShown) {
                    isSnackBarShown = true;
                    showSnackBar(context, 'Time is up!');
                  }
                  if (minutes == 2 && seconds == 35 && !isDialogShown) {
                    isDialogShown = true;
                    showCustomAlert(context, 'Time is up!');
                  }
                  return MyTitleText(
                      text: '$minutes:${seconds.toString().padLeft(2, '0')}');
                },
                interval: const Duration(seconds: 1),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.04),
            MyElevatedButton(
              text: '       Submit',
              fontsize: 22,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color(0xFFFFFFFF),
                  context: context,
                  builder: (contex) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.56,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/p.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 6,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment(0, 0.48),
                          child: MyTitleText(text: 'Register Successfully'),
                        ),
                        const Align(
                          alignment: Alignment(0, 0.6),
                          child: MySubtitleText(
                              text:
                                  'Congratulation! your account already created.'),
                        ),
                        const Align(
                          alignment: Alignment(0, 0.7),
                          child: MySubtitleText(
                              text: 'Please login to get amazing experience.'),
                        ),
                        Align(
                          alignment: const Alignment(0, 0.96),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: MyElevatedButton(
                              text: 'Go to Homepage',
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contex) => const MyBottomNav(),
                                    ),
                                    (route) => false);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MySubtitleText(
                  text: 'Didn’t receive the code: 22A21V0',
                  fontSize: 17,
                ),
                Gap(10),
                MyTitleText(
                  text: 'Resend',
                  fontSize: 18,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showCustomAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
