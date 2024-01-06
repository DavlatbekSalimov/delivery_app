import 'package:catchy/constants/colors/colors.dart';
import 'package:catchy/scr/check_rates_page/check_rates_page.dart';
import 'package:catchy/scr/help_center_page/help_center_page.dart';
import 'package:catchy/scr/nearby_drop_page/nearby_drop_page.dart';
import 'package:catchy/scr/order_page/order_page.dart';
import 'package:catchy/scr/wallet_page/wallet_page.dart';
import 'package:flutter/material.dart';

class FeaturesTables extends StatelessWidget {
  const FeaturesTables({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (contex, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => index == 0
                    ? const CheckRatesPage()
                    : index == 1
                        ? const NearbyDropPage()
                        : index == 2
                            ? const OrederPage()
                            : index == 3
                                ? const HelpCenter()
                                : const WalletPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                  color: white),
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: (index == 2 || index == 4 || index == 5)
                      ? const EdgeInsets.all(20)
                      : const EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/images/${imagespath.elementAt(index)}.png',
                    fit: (index == 2 || index == 4 || index == 5)
                        ? BoxFit.fitHeight
                        : BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

List<String> imagespath = [
  'table1',
  'table2',
  'table3',
  'table4',
  'table5',
  'table6'
];
