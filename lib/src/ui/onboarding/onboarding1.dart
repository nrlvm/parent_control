import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Container(
        height: 648 * h,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: Column(
          children: [
            SizedBox(
              height: 104 * h,
            ),
            Image.asset(
              'assets/onboard/o1.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 44 * h,
            ),
            Text(
              'Control and educate correctly',
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
              'Set tasks and control the time spent '
                  'online and the content of the child',
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
