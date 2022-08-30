import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/utils/weekday_util.dart';

class WeekdayWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) change;

  const WeekdayWidget({
    Key? key,
    required this.selectedIndex,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return SizedBox(
      height: 80 * h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(0);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 0 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 0 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(0),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                          selectedIndex == 0 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(1);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 1 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 1 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(1),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 1 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(2);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 2 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 2 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(2),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 2 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(3);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 3 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 3 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(3),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 3 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(4);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 4 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 4 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(4),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 4 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(5);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 5 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 5 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(5),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 5 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                change(6);
              },
              child: Container(
                height: 32 * h,
                width: 32 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectedIndex == 6 ? AppColor.dBlue : AppColor.white,
                  border: Border.all(
                    color: selectedIndex == 6 ? AppColor.dBlue : AppColor.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekdayUtil.getDay(6),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      height: 14 / 12,
                      color:
                      selectedIndex == 6 ? AppColor.white : AppColor.dark,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
