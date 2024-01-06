import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/messages_page/mysms_widget.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WritePage extends StatefulWidget {
  final String? imagename;
  final String? name;
  const WritePage({
    super.key,
    this.imagename,
    this.name,
  });

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController _messageController = TextEditingController();
  bool send = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: white,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/person${widget.imagename}.png'),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTitleText(
                  text: widget.name!,
                  fontSize: 20,
                ),
                const MySubtitleText(text: 'Online'),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.call,
            color: black,
          ),
          const Gap(6),
          const Padding(
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
            const MySmss(
              message: 'Thank You! I’ll be waiting for that',
            ),
            const HisSms(),
            MySmss(
              message:
                  'Hi, ${widget.name} the package already delivered,Thanks!',
            ),
            const HisSms(
              message:
                  'I Came yo your house with the order in hand, where should i put it or do you go out yourself.',
            ),
            send && _messageController.text.isNotEmpty
                ? MySmss(
                    message: _messageController.text,
                  )
                : const MyTitleText(text: ''),
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
                      height: 64,
                      child: MyTextFildTwo(
                        controller: _messageController,
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        send = !send;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/send.svg',
                      height: 45,
                    ),
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

class HisSms extends StatelessWidget {
  final String? message;
  const HisSms({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 40,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Color.fromARGB(255, 231, 227, 227),
            ),
            height: MediaQuery.of(context).size.height * 0.14,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: MySubtitleText(
                    text: message ??
                        'Hai Rizal, I’m on the way to your home, Pleasewait a moment. Thanks!',
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: MySubtitleText(text: '5:20 Pm'),
        ),
      ],
    );
  }
}
