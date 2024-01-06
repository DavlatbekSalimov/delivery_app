import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/home_page/widgets/mybalances_widget.dart';
import 'package:catchy/scr/home_page/widgets/product_container_widgets.dart';
import 'package:catchy/scr/wallet_page/top_up_page.dart';
import 'package:catchy/widgets/my_cricularbutton.dart';
import 'package:catchy/widgets/my_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MyTitleText(
          text: 'Wallet',
          fontSize: 20,
        ),
        leading: const MyCricularButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: MyBalance(
                subtitle: true,
                fillcolor: white,
                assetimage: true,
                suffixicon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const TopUpPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/addtwo.svg',
                    height: 30,
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTitleText(
                  text: 'Payment Method',
                  fontSize: 20,
                ),
                Icon(
                  Icons.add,
                  size: 34,
                  color: Color(0xFFFD683D),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              child: ProductContainer(
                prefixicon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/cardicon.svg'),
                ),
                sufixtext: '',
                sidecolor: black,
                titletext: 'Mastercard',
                subtitletext: '6895 3526 8456 ****',
              ),
            ),
            const MyTitleText(
              text: 'Transaction History',
              fontSize: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ProductContainer(
                      sufixtext: sufixtext.elementAt(index),
                      titletext: titletext.elementAt(index),
                      subtitletext: subtitletext.elementAt(index),
                      sufixcolor: black,
                      prefixicon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/${prefixes.elementAt(index)}.png',
                          height: index == 0 ? 40 : null,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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

List<String> prefixes = ['container', 'cargo', 'carexpress', 'containericon'];
List<String> titletext = [
  'Drop Off Payment',
  'Cargo Shipping',
  'Express Shipping',
  'Pick Up Payment'
];
List<String> subtitletext = [
  'Mar 18, 2022',
  'Mar 10, 2022',
  'Mar 6, 2022',
  'Mar 2, 2022'
];
List<String> sufixtext = [r'$25.5', r'$29.5', r'$50.6', r'$16,8'];
