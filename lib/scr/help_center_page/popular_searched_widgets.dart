import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';

class PopularSearchedWidgets extends StatelessWidget {
  final String text;
  const PopularSearchedWidgets({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: white,
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTitleText(
            text: text,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
