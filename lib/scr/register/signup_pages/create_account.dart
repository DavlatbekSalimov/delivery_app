import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/constants/widget/tabbar.dart';
import 'package:catchy/scr/verification_page/verification.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CreateAccount extends StatefulWidget {
  final String phoneNumber;

  const CreateAccount({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController numberEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCricularButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTitleText(text: 'Shipping and Track Anytime '),
              const MySubtitleText(text: 'Get great experience with tracky'),
              Gap(MediaQuery.of(context).size.height * 0.04),
              const RegisterTabBar(),
              const Gap(20),
              MyTextFild(
                text: 'Full Name',
                isactiveIcon: Icon(
                  Icons.person_3,
                  color: color2,
                  size: 30,
                ),
                prefixIcon: const Icon(
                  Icons.person_3_outlined,
                  size: 30,
                ),
                hinttext: 'Enter your name',
              ),
              MyTextFild(
                controller: numberEditingController,
                text: 'Phone Number',
                isactiveIcon: Icon(
                  Icons.call,
                  color: color2,
                  size: 30,
                ),
                prefixIcon: const Icon(
                  Icons.call,
                  size: 30,
                ),
                hinttext: 'Enter your number',
              ),
              MyTextFild(
                text: 'Password',
                isactiveIcon: Icon(
                  CupertinoIcons.lock_fill,
                  color: color2,
                  size: 30,
                ),
                prefixIcon: const Icon(
                  CupertinoIcons.lock,
                  size: 30,
                ),
                hinttext: 'Enter your password',
              ),
              const Gap(18),
              MyElevatedButton(
                text: 'Create Account',
                backgroundColor: color2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyAccount(
                        phoneNumber: numberEditingController.text,
                      ),
                    ),
                  );
                },
              ),
              const Gap(18),
              const Divider(),
              const Gap(10),
              const Center(
                child: MySubtitleText(text: 'Or Sign Up With'),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/google.svg'),
                  const Gap(10),
                  const MyTitleText(text: 'Sign Up with Google'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... other code ...

class MyTextFild extends StatefulWidget {
  final String text;
  final String hinttext;
  final Widget? prefixIcon;
  final Widget? isactiveIcon;
  final TextEditingController? controller;
  const MyTextFild({
    Key? key,
    required this.text,
    required this.hinttext,
    this.prefixIcon,
    this.isactiveIcon,
    this.controller,
  }) : super(key: key);

  @override
  State<MyTextFild> createState() => _MyTextFildState();
}

class _MyTextFildState extends State<MyTextFild> {
  bool isactive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTitleText(
            text: widget.text,
            fontSize: 20,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  isactive = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: widget.hinttext,
                prefixIcon: isactive ? widget.isactiveIcon : widget.prefixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isactive ? Colors.black : Colors.black12,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
