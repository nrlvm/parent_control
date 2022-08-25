import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/date_util.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var newDate = DateTime.now();
  String date = 'Choose Date';
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int setHour = 0;
  int setMinute = 0;
  int endHour = 0;
  int endMinute = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        elevation: 0,
        title: Text('Tasks ${usersModel.name}'),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: usersModel.photo != ""
                ? Image.file(
                    File(usersModel.photo),
                    height: 48 * h,
                    width: 48 * h,
                    fit: BoxFit.cover,
                  )
                : NoPhoto(
                    gender: usersModel.gender,
                    main: false,
                  ),
          ),
          SizedBox(
            width: 16 * w,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16 * h,
          ),
          Container(
            height: 592 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25 * h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CalendarDatePicker(
                        initialDate: newDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025, 1, 1),
                        onDateChanged: (newDate) {
                          year = newDate.year;
                          month = newDate.month;
                          day = newDate.day;
                          setState(() {});
                        },
                      ),
                    );

                    setState(() {});
                  },
                  child: SizedBox(
                    height: 19 * h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        '${dateUtil.getToString(month)} $day, $year',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16 * h,
                          height: 19 / 16,
                          color: AppColor.dark,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20 * h,
                ),
                Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16 * h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.dWhite,
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title Name',
                        hintStyle: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 16 * h,
                          height: 19 / 16,
                          color: AppColor.dark.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              setHour = value.hour;
                              setMinute = value.minute;
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        height: 56 * h,
                        width: 156 * w,
                        padding: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/set_start.svg'),
                            SizedBox(
                              width: 8 * w,
                            ),
                            Text(
                              setHour != 0 && setMinute != 0?
                              '$setHour : $setMinute' : '00 : 00',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16 * h,
                                height: 19 / 16,
                                color: AppColor.dark,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              endHour = value.hour;
                              endMinute = value.minute;
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        width: 155 * w,
                        height: 56 * h,
                        padding: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/set_start.svg'),
                            SizedBox(
                              width: 8 * w,
                            ),
                            Text(
                              endHour != 0 && endMinute != 0?
                              '$endHour : $endMinute' : ' 00 : 00',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16 * h,
                                height: 19 / 16,
                                color: AppColor.dark,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
