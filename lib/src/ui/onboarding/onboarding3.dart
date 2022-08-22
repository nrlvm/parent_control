import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key? key}) : super(key: key);

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
              'assets/onboard/o3.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 44 * h,
            ),
            Text(
              'Create profiles for your kids',
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
              'Create unique profiles for your '
                  'kids for their different lifestyles',
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
