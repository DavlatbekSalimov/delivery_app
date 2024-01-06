import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/profile_page/current_password_page.dart';
import 'package:catchy/scr/profile_page/edit_profile_page.dart';
import 'package:catchy/scr/profile_page/language_page.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/home.png',
                width: double.infinity,
                height: 215,
                fit: BoxFit.cover,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTitleText(
                            text: 'My Profile',
                            color: white,
                          ),
                          //! actions
                        ],
                      ),
                      const Gap(19),
                      //!
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/myprofile.png'),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTitleText(
                                  text: 'Micheal Sam',
                                  fontSize: 19,
                                  color: white,
                                ),
                                MyTitleText(
                                  text: '+01 65841542265',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: white,
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contex) => const EditProfilePage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 0.15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: MyTitleText(
                                text: 'Edit Profile',
                                color: white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //! body
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.67,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! settings
                    const MyTitleText(
                      text: 'Settings',
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (contex, index) {
                          return IconTextButton(
                            onTap: () {
                              index == 0
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (contex) =>
                                            const CurrentPasswordPage(),
                                      ),
                                    )
                                  : index == 1
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (contex) =>
                                                const LanguagePage(),
                                          ),
                                        )
                                      : null;
                            },
                            textt: settingstexts.elementAt(index),
                            iconname: settingsimagename.elementAt(index),
                          );
                        },
                      ),
                    ),
                    //! about us
                    const MyTitleText(
                      text: 'About Us',
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (contex, index) {
                          return IconTextButton(
                            textt: aboutustexts.elementAt(index),
                            iconname: aboutusimagename.elementAt(index),
                          );
                        },
                      ),
                    ),
                    //! other
                    const MyTitleText(
                      text: 'Other',
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (contex, index) {
                          return IconTextButton(
                            textt: othertexts.elementAt(index),
                            iconname: otherimagename.elementAt(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String? iconname;
  final String? textt;
  final void Function()? onTap;
  const IconTextButton({
    super.key,
    this.iconname,
    this.textt,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            border: Border.all(
              color: Colors.black26,
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/$iconname.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(6),
              MyTitleText(
                text: textt!,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> settingstexts = [
  'Change Password',
  'Language',
  'Notification',
];

List<String> settingsimagename = [
  'lock',
  'globe',
  'notification',
];
//! about us
List<String> aboutustexts = [
  'FAQ',
  'Privacy Policy',
  'Contact Us',
];

List<String> aboutusimagename = [
  'faq',
  'security',
  'contact',
];
//! other
List<String> othertexts = [
  'Share',
  'Get The Latest Version',
];

List<String> otherimagename = [
  'share',
  'mobile',
];
