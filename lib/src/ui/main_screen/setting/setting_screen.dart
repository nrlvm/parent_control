import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
              height: 65 * h,
            ),
            Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 22 * h,
                  height: 26 / 22,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(
              height: 35 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.only(left: 16 * w, right: 8 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/arrow_right.svg'),
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.only(left: 16 * w, right: 8 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Term of Use',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/arrow_right.svg'),
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.only(left: 16 * w, right: 8 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Support',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/arrow_right.svg'),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddChildScreen(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56 * h,
                margin: EdgeInsets.symmetric(horizontal: 40 * h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColor.white,
                ),
                child: Center(
                  child: Text(
                    'Add Child',
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 18 * h,
                      height: 21 / 18,
                      color: AppColor.dBlue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              margin: EdgeInsets.symmetric(horizontal: 40 * h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: AppColor.white,
                ),
              ),
              child: Center(
                child: Text(
                  'Add services',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 18 * h,
                    height: 21 / 18,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 34 * h,
            ),
          ],
        ),
      ),
    );
  }
}
