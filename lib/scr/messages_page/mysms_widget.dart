import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';

class MySmss extends StatelessWidget {
  final String? message;
  const MySmss({
    super.key,
    this.message,
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
                      text: message ?? 'Why did the expedition turning around?',
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
