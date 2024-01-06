// ignore_for_file: prefer_const_constructors

import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/messages_page/write_page.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MessagesPagee extends StatefulWidget {
  const MessagesPagee({super.key});

  @override
  State<MessagesPagee> createState() => _MessagesPageeState();
}

class _MessagesPageeState extends State<MessagesPagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! appbar
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
                              text: 'Messages',
                              color: white,
                            ),
                            //! actions
                            Stack(
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //! body
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return People(
                    imagename: index + 1,
                    title: title.elementAt(index),
                    subtitle: subtitle.elementAt(index),
                    data: index == 0
                        ? '3:74 Pm'
                        : index == 1
                            ? '6:32 Pm'
                            : index == 2
                                ? '7:22 Pm'
                                : 'Yesterday',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => WritePage(
                            imagename: '${index + 1}',
                            name: title.elementAt(index),
                          ),
                        ),
                      );
                    },
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

List<String> title = [
  'Maddy Lin',
  'Sarah Jen',
  'Ron Edward',
  'Alice Adam',
  'Will Smith',
  'Jessica Ben',
  'Davlat',
  'Alpomish',
];

List<String> subtitle = [
  'Hai Rizal, I’m on the way ...',
  'woohoooo',
  'Haha that`s terrifying 😂',
  'Wow, this is really epic',
  'Just ideas for next time',
  'How are you?',
  'typing ...',
  'typing ...',
];

class People extends StatelessWidget {
  final String data;
  final int? imagename;
  final String? title;
  final String? subtitle;
  final Function()? ontap;
  const People({
    super.key,
    required this.data,
    this.imagename,
    this.title,
    this.subtitle,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            onTap: ontap,
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person$imagename.png'),
              radius: 30,
            ),
            title: MyTitleText(
              text: title ?? '',
              fontSize: 20,
            ),
            subtitle: MySubtitleText(
              text: subtitle ?? '',
              fontSize: 16,
            ),
            trailing: MySubtitleText(text: data),
          ),
          Divider(
            height: 20,
          ),
        ],
      ),
    );
  }
}
