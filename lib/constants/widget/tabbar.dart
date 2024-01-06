import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/scr/register/signup_pages/create_account.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';

class RegisterTabBar extends StatelessWidget {
  final Color? leftbackgroundColor;
  final Color? lefttextcolor;
  final Color? rightbackgroundColor;
  final Color? righttextcolor;
  final String? lefttext;
  final String? righttext;
  final void Function()? leftonTap;
  final void Function()? rightonTap;
  const RegisterTabBar({
    super.key,
    this.leftbackgroundColor,
    this.lefttextcolor,
    this.rightbackgroundColor,
    this.righttextcolor,
    this.lefttext,
    this.righttext,
    this.leftonTap,
    this.rightonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFF8F9FB),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: leftonTap ??
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) =>
                            const CreateAccount(phoneNumber: ''),
                      ),
                    );
                  },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.089,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: leftbackgroundColor ?? Colors.white,
                ),
                child: Center(
                  child: MyTitleText(
                    text: lefttext ?? 'Sign Up',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: rightonTap ??
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const SignInPage(),
                      ),
                    );
                  },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.089,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: rightbackgroundColor),
                child: Center(
                  child: MyTitleText(
                    text: righttext ?? 'Sign In',
                    color: righttextcolor ?? const Color(0xFFA7A9B7),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
