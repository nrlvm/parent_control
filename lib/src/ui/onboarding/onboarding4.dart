import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: Column(
          children: [
            SizedBox(
              height: 104 * h,
            ),
            Image.asset(
              'assets/onboard/o4.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 44 * h,
            ),
            Text(
              'Pre-configured popular services',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 28 * h,
                height: 36 / 28,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 18 * h,
            ),
            Text(
              'Subscribe to unlock all the features, just \$3.99/week',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 18 * h,
                height: 24 / 18,
                color: AppColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
