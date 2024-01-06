import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/register/signin_pages/signin_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(MediaQuery.of(context).size.height * 0.1),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      const Positioned(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/editprofilpersonimage.png'),
                          radius: 60,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.08,
                        right: MediaQuery.of(context).size.height * 0.001,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: white,
                            ),
                            borderRadius: BorderRadius.circular(
                              35,
                            ),
                            color: const Color(0xFF1D272F),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/camera.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyTextFild(
                controller: _nameController,
                onChanged: (p0) {
                  setState(() {});
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/person.svg'),
                ),
                isactiveIcon: Image.asset(
                  'assets/icons/personactiv.png',
                  height: 30,
                ),
                text: 'Full Name',
                hinttext: 'Micheal Sam',
                suffixIcon: _nameController.text.isNotEmpty
                    ? Icon(
                        Icons.check_circle_sharp,
                        color: black,
                      )
                    : null,
              ),
              MyTextFild(
                controller: _phoneController,
                onChanged: (p0) {
                  setState(() {});
                },
                suffixIcon: _phoneController.text.isNotEmpty
                    ? Icon(
                        Icons.check_circle_sharp,
                        color: black,
                      )
                    : null,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/call.svg'),
                ),
                isactiveIcon: Image.asset(
                  'assets/icons/callactiv.png',
                ),
                text: 'Phone Number',
                hinttext: '+998 000 00 00',
              ),
              Gap(
                MediaQuery.of(context).size.height * 0.28,
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
