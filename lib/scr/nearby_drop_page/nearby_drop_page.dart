// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';
import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/notification_page/notification_page.dart';
import 'package:catchy/widgets/my_bottom_nav.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_line_container.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NearbyDropPage extends StatefulWidget {
  const NearbyDropPage({super.key});

  @override
  State<NearbyDropPage> createState() => _NearbyDropPageState();
}

class _NearbyDropPageState extends State<NearbyDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCricularButton(),
        centerTitle: true,
        title: const MyTitleText(
          text: 'Nearby Drop',
          fontSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              size: 26,
              color: black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/map.png',
            height: MediaQuery.of(context).size.height * 0.88,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: white,
                  context: context,
                  builder: (contex) {
                    return newMethod(context);
                  });
            },
            child: Align(
              alignment: const Alignment(-0.8, -0.9),
              child: Image.asset(
                'assets/images/courier.png',
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.9, -0.18),
            child: Image.asset(
              'assets/images/courier.png',
            ),
          ),
          Align(
            alignment: const Alignment(-0.5, 0.8),
            child: Image.asset(
              'assets/images/courier.png',
            ),
          ),
        ],
      ),
    );
  }

  Container newMethod(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          Gap(10),
          LineContainer(
            width: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                MyTextFildTwo(
                  color: Colors.white10,
                  prefixicon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                  text: 'Search location',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.335,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: white,
                                  context: context,
                                  builder: (contex) {
                                    return newMethod2(context);
                                  });
                            },
                            child: Message(
                              index: index,
                              backgroundColor: white,
                              icon: SvgPicture.asset(
                                  'assets/icons/locationpoint.svg'),
                              title: title.elementAt(index),
                              subtitle: (index == 0)
                                  ? '4517 Washington Ave. Manchester.'
                                  : "2118 Thornridge Cir. Syracuse...",
                              suffixtext:
                                  '${Random().nextInt(3)}.${Random().nextInt(10)} KM',
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container newMethod2(contex) {
  return Container(
    height: double.maxFinite,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: LineContainer(
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset('assets/icons/locationpoint.svg'),
              ),
            ),
          ),
          MyTitleText(
            text: 'New Montgomery',
            fontSize: 22,
          ),
          MySubtitleText(text: '4517 Washington Ave. Manchester, Kentucky'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.access_time_filled_outlined,
                color: color2,
              ),
              MyTitleText(
                text: '09:00 AM - 05:00PM',
                fontSize: 15,
              ),
              SvgPicture.asset('assets/icons/distance.svg'),
              MyTitleText(
                text: '4.5 KM from you',
                fontSize: 10,
              ),
            ],
          ),
          Gap(14),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MySubtitleText(
              text: '0812274616352',
              fontSize: 25,
            ),
          ),
          Divider(),
          //
          MyElevatedButton(
            buildContext: contex,
            text: 'Dial',
            width: 150,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  contex,
                  MaterialPageRoute(
                    builder: (contex) => MyBottomNav(),
                  ),
                  (route) => false);
            },
          ),
          Gap(10),
          MyElevatedButton(
            text: 'Direction',
            textColor: black,
            width: 130,
            sideColor: Colors.black38,
            backgroundColor: white,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

List<String> title = [
  'New Montgomery',
  'Manchester',
  'New Castle',
  'New Montgomery',
];
