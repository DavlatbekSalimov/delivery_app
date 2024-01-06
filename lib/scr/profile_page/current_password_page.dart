import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CurrentPasswordPage extends StatefulWidget {
  const CurrentPasswordPage({super.key});

  @override
  State<CurrentPasswordPage> createState() => _CurrentPasswordPageState();
}

class _CurrentPasswordPageState extends State<CurrentPasswordPage> {
  bool issecurty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCricularButton(),
        centerTitle: true,
        title: const MyTitleText(
          text: 'Edit Profile',
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Gap(20),
              MyTextFild(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        issecurty = !issecurty;
                      });
                    },
                    icon: Icon(
                      issecurty
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill,
                    )),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lock.svg'),
                ),
                isactiveIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lockactiv.svg'),
                ),
                text: 'Current Password',
                hinttext: 'Enter your password',
                countrytext: 'Forgot Password',
                //obscureText: issecurty,
              ),
              MyTextFild(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lock.svg'),
                ),
                isactiveIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lockactiv.svg'),
                ),
                text: 'New Password',
                hinttext: 'Confirm your password',
              ),
              MyTextFild(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lock.svg'),
                ),
                isactiveIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lockactiv.svg'),
                ),
                text: 'Confirm Password',
                hinttext: 'Repeat your new password',
              ),
              Gap(
                MediaQuery.of(context).size.height * 0.34,
              ),
              MyElevatedButton(
                text: 'Save Changes',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
