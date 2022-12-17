import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/home_chart_widget.dart';
import 'package:parent_control/src/widget/home_task_widget.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:parent_control/src/widget/row_tasks_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
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
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int alertCounter = 0;

  @override
  void initState() {
    getAlerts(widget.userModel.id);
    super.initState();
  }

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
                widget.userModel.photo == ""
                    ? NoPhoto(
                        gender: widget.userModel.gender,
                        main: true,
                      )
                    : Image.file(
                        File(widget.userModel.photo),
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
                        widget.userModel.name,
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
          widget.taskModel.isNotEmpty
              ? HomeTaskWidget(
                  data: widget.taskModel.first,
                )
              : SizedBox(
                  height: 26 * h,
                ),
          SizedBox(
            height: 24 * h,
          ),
          RowTasksWidget(
            leftTasks: widget.leftTasks,
            leftWeekTasks: widget.leftWeekTasks,
          ),
          SizedBox(
            height: 16 * h,
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
                    text: '${widget.allTasksToday.toString()} activities ',
                    style: TextStyle(
                      color: widget.allTasksToday != 0
                          ? AppColor.dBlue
                          : AppColor.dark,
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
          HomeChartWidget(
            taskCount: widget.taskCount,
          ),
          SizedBox(
            height: 16 * h,
          ),
          Container(
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 40 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32 * h),
              color: alertCounter > 0.3 ? AppColor.orange : AppColor.dBlue,
            ),
            child: Center(
              child: Text(
                '$alertCounter alerts need review',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 18 * h,
                  color: AppColor.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getAlerts(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int likeCount = prefs.getInt('$userId LIKES') ?? 0;
    int dislikeCount = prefs.getInt('$userId DISLIKES') ?? 0;
    alertCounter = dislikeCount;
    setState(() {});
    return alertCounter;
  }
}
