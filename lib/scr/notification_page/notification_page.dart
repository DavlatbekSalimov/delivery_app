import 'dart:math';

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCricularButton(),
        title: const MyTitleText(
          text: 'Notification',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const MyTitleText(
                  text: 'Recent',
                  fontSize: 24,
                ),
                const Gap(5),
                CircleAvatar(
                  backgroundColor: color2,
                  radius: 10,
                  child: MyTitleText(
                    text: '4',
                    color: white,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                MyTitleText(
                  text: 'Clear All',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: color2,
                ),
              ],
            ),
            const Gap(20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (contex, index) {
                    return Message(
                      title: titletexts.elementAt(index),
                      index: index,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final int index;
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final String? suffixtext;
  final Color? backgroundColor;

  const Message({
    Key? key,
    required this.index,
    this.title,
    this.subtitle,
    this.suffixtext,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: backgroundColor ?? const Color(0xFF1D272F),
                  child: icon ??
                      Image.asset(
                          'assets/icons/${imagepaths.elementAt(index)}.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTitleText(
                      text: title ?? 'Kathryn Sent You a Message',
                      fontSize: 16,
                    ),
                    MySubtitleText(text: subtitle ?? 'Tap to see the message'),
                  ],
                ),
                suffixtext != null
                    ? MyTitleText(
                        text: suffixtext ?? '',
                        fontSize: 16,
                      )
                    : MySubtitleText(text: '${Random().nextInt(10)} m ago')
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

List<String> imagepaths = [
  'nmessage',
  'box',
  'nmessage',
  'discount',
  'nmessage',
];

List<String> titletexts = [
  'Kathryn Sent You a Message',
  'Your Shipping Already Delivered',
  'Try The Latest Service Tracky!',
  'Get 20% Discount First Transa',
  'Kathryn Sent You a Message',
];
