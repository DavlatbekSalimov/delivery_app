import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/mybalances_widget.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_elevated_button.dart';
import 'package:catchy/widgets/my_subtitle_text.dart';
import 'package:catchy/widgets/my_textfild_two.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:catchy/widgets/payment_method.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MyTitleText(
          text: 'Top Up',
          fontSize: 20,
        ),
        leading: const MyCricularButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBalance(
              subtitle: true,
              fillcolor: white,
              assetimage: true,
              suffixtext: '',
              suffixicon: null,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: MyTitleText(
                text: 'Top up Balance',
                fontSize: 20,
              ),
            ),
            const MySubtitleText(
              text: 'Choose a payment method to continue',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: MyTextFildTwo(
                color: white,
                text: 'Select payment method',
                suffixicon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 40,
                  color: Colors.black26,
                ),
              ),
            ),
            //! size
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MyElevatedButton(
                width: MediaQuery.of(context).size.width * 0.35,
                text: 'Continue',
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return const MyPaymentMethod(
                        topupimage: true,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
