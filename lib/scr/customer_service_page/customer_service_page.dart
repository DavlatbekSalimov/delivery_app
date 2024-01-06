import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomerServicerPage extends StatefulWidget {
  const CustomerServicerPage({super.key});

  @override
  State<CustomerServicerPage> createState() => _CustomerServicerPageState();
}

class _CustomerServicerPageState extends State<CustomerServicerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                  radius: 25,
                ),
                Positioned(
                  left: 32,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: white,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: black,
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTitleText(
                  text: 'Customer Service',
                  fontSize: 20,
                ),
                MySubtitleText(text: 'Online'),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Divider(
              height: 30,
            ),
            const MySms(
              message: '',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF9F9F9),
                ),
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MySubtitleText(
                      text:
                          'There are several possible roundabout expeditions :',
                    ),
                    MyTitleText(
                      text: '1. There is an error in the package',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    MySubtitleText(
                      text: 'Lack of goods, or not in accordance with',
                    ),
                    MySubtitleText(
                      text: 'the order that has been made.',
                    ),
                    MyTitleText(
                      text: ' 2.  Constrained by the weather',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    MySubtitleText(
                      text:
                          'Therewas a big rain, earthquake that \nmade it impossible to carry out an expedition.',
                    ),
                    MyTitleText(
                      text: 'Read More',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MySubtitleText(text: '5:20 Pm'),
            ),
            const MySms(
              message: '',
            ),
            Gap(MediaQuery.of(context).size.height * 0.08),
            const Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: MyTextFildTwo(
                        prefixicon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/addfile.svg'),
                        ),
                        suffixicon: const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 28,
                          color: Color(0xFFA7A9B7),
                        ),
                        text: 'Type your message',
                        color: const Color.fromARGB(255, 247, 243, 243),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SvgPicture.asset(
                    'assets/icons/send.svg',
                    height: 45,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySms extends StatelessWidget {
  const MySms({
    super.key,
    required String message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D272F),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: MyTitleText(
                      text: 'Why did the expedition turning around?',
                      fontSize: 16,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const MySubtitleText(text: '5:09 Pm'),
        ],
      ),
    );
  }
}
