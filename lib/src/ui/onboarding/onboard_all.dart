import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/ui/onboarding/onboarding1.dart';
import 'package:parent_control/src/ui/onboarding/onboarding2.dart';
import 'package:parent_control/src/ui/onboarding/onboarding3.dart';
import 'package:parent_control/src/ui/onboarding/onboarding4.dart';
import 'package:parent_control/src/utils/utils.dart';

class OnboardAll extends StatefulWidget {
  const OnboardAll({Key? key}) : super(key: key);

  @override
  State<OnboardAll> createState() => _OnboardAllState();
}

class _OnboardAllState extends State<OnboardAll> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    currentPage = 0;
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Column(
        children: [
          SizedBox(
            height: 648 * h,
            child: PageView(
              controller: controller,
              children: const [
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
                Onboarding4(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.page != 3
                  ? controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              )
                  : Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const AddChildScreen(),
                  ),
                      (Route<dynamic> route) => false);
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 56 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: AppColor.white,
              ),
              child: Center(
                child: Text(
                  'Continue',
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
            height: 35 * h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 46 * w),
            child: Row(
              children: [
                Text(
                  'Terms of Use',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * h,
                    height: 16 / 14,
                    decoration: TextDecoration.underline,
                    color: AppColor.dBlue,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Restore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * h,
                      height: 16 / 14,
                      decoration: TextDecoration.underline,
                      color: AppColor.dBlue,
                    ),
                  ),
                ),
                Text(
                  'Privacy policy',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * h,
                    height: 16 / 14,
                    decoration: TextDecoration.underline,
                    color: AppColor.dBlue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
