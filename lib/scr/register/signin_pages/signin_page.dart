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

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              RegisterTabBar(
                rightbackgroundColor: white,
                leftbackgroundColor: Colors.white10,
              ),
              const Gap(30),
              MyTextFild(
                controller: numberEditingController,
                text: 'Phone Number',
                isactiveIcon: Icon(
                  Icons.call,
                  color: color2,
                  size: 30,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/call.svg'),
                ),
                hinttext: 'Enter your number',
              ),
              const Gap(30),
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
              const Gap(30),
              MyElevatedButton(
                text: '          Sign In',
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
              const Gap(20),
              const Divider(),
              const Gap(20),
              const Center(
                child: MySubtitleText(text: 'Or Sign Up With'),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/google.svg'),
                  const Gap(10),
                  const MyTitleText(text: 'Sign Up with Google'),
                ],
              ),
              const Gap(30),
              MyElevatedButton(
                width: 100,
                widgett: Icon(
                  Icons.apple_outlined,
                  size: 30,
                  color: white,
                ),
                text: 'Sign Up Apple',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFild extends StatefulWidget {
  final String text;
  final String hinttext;
  final Widget? prefixIcon;
  final Widget? isactiveIcon;
  final Widget? suffixIcon;
  final String? countrytext;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  const MyTextFild({
    Key? key,
    required this.text,
    required this.hinttext,
    this.prefixIcon,
    this.isactiveIcon,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.countrytext,
    this.obscureText = false,
    this.keyboardType,
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
            //! kerakli
            child: TextFormField(
              keyboardType: widget.keyboardType,
              minLines: 1,
              maxLines: 5,
              scrollPadding: const EdgeInsets.all(20),
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  isactive = value.isNotEmpty;
                  widget.onChanged?.call(value);
                });
              },
              style: const TextStyle(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: widget.hinttext,
                counterText: widget.countrytext,
                counterStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black26,
                ),
                prefixIcon: isactive ? widget.isactiveIcon : widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
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
              obscureText: widget.obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
