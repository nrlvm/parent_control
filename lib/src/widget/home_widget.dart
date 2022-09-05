import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/home_chart_widget.dart';
import 'package:parent_control/src/widget/home_task_widget.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:parent_control/src/widget/row_tasks_widget.dart';

class HomeWidget extends StatelessWidget {
  final UsersModel userModel;
  final List<TaskModel> taskModel;
  final int leftTasks;
  final int leftWeekTasks;
  final int allTasksToday;
  final List<double> taskCount;

  const HomeWidget({
    Key? key,
    required this.userModel,
    required this.taskModel,
    required this.leftTasks,
    required this.leftWeekTasks,
    required this.allTasksToday,
    required this.taskCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 568 * h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16 * h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160 * h,
            width: 343 * w,
            child: Stack(
              children: [
                userModel.photo == ""
                    ? NoPhoto(
                        gender: userModel.gender,
                        main: true,
                      )
                    : Image.file(
                        File(userModel.photo),
                        width: 343 * w,
                        height: 160 * h,
                        fit: BoxFit.cover,
                      ),
                // :SizedBox(),
                Positioned(
                  bottom: 16 * h,
                  left: 16 * w,
                  right: 16 * w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        userModel.name,
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 32 * h,
                          height: 38 / 32,
                          color: AppColor.blue,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/settings.svg',
                        color: AppColor.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 21 * h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Text(
              'Current Task',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12 * h,
                height: 14 / 12,
                color: AppColor.dark.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(
            height: 10 * h,
          ),
          taskModel.isNotEmpty
              ? HomeTaskWidget(
                  data: taskModel.first,
                )
              : SizedBox(
                  height: 26 * h,
                ),
          SizedBox(
            height: 24 * h,
          ),
          RowTasksWidget(
            leftTasks: leftTasks,
            leftWeekTasks: leftWeekTasks,
          ),
          SizedBox(
            height: 28 * h,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 16 * h,
                  height: 19 / 16,
                ),
                children: [
                  TextSpan(
                    text: '${allTasksToday.toString()} activities ',
                    style: TextStyle(
                      color:
                          allTasksToday != 0 ? AppColor.dBlue : AppColor.dark,
                    ),
                  ),
                  TextSpan(
                    text: 'for today',
                    style: TextStyle(
                      color: AppColor.dark,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SvgPicture.asset(
                      'assets/icons/arrow_right.svg',
                      alignment: Alignment.center,
                      color: AppColor.dBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          HomeChartWidget(
            taskCount: taskCount,
          ),
        ],
      ),
    );
  }
}
