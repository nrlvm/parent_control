import 'package:flutter/cupertino.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class RowTasksWidget extends StatelessWidget {
  final int leftTasks;
  final int leftWeekTasks;

  const RowTasksWidget({
    Key? key,
    required this.leftTasks,
    required this.leftWeekTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int alerts = 0;
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      child: Row(
        children: [
          Container(
            width: 94 * w,
            height: 72 * h,
            padding: EdgeInsets.symmetric(horizontal: 5 * w, vertical: 5 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.dWhite,
            ),
            child: Column(
              children: [
                Text(
                  leftTasks.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 24 * h,
                    height: 28 / 24,
                    color: AppColor.dBlue,
                  ),
                ),
                SizedBox(
                  height: 2 * h,
                ),
                Text(
                  'Left to complete',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 13 * h,
                    height: 14 / 12,
                    color: AppColor.dark.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 94 * w,
            height: 72 * h,
            padding: EdgeInsets.symmetric(horizontal: 5 * w, vertical: 5 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.dWhite,
            ),
            child: Column(
              children: [
                Text(
                  alerts.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 24 * h,
                    height: 28 / 24,
                    color: alerts == 0 ? AppColor.dark : AppColor.orange,
                  ),
                ),
                SizedBox(
                  height: 2 * h,
                ),
                Text(
                  'Alerts need review',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 13 * h,
                    height: 14 / 12,
                    color: AppColor.dark.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 94 * w,
            height: 72 * h,
            padding: EdgeInsets.symmetric(horizontal: 5 * w, vertical: 5 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.dWhite,
            ),
            child: Column(
              children: [
                Text(
                  leftWeekTasks.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 24 * h,
                    height: 28 / 24,
                    color: AppColor.dark,
                  ),
                ),
                SizedBox(
                  height: 2 * h,
                ),
                Text(
                  'Tasks for the week',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 13 * h,
                    height: 14 / 12,
                    color: AppColor.dark.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
