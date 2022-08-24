import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
            child: usersModel.photo == ""
                ? Image.file(
                    File(usersModel.photo),
                    height: 48 * h,
                    width: 48 * h,
                    fit: BoxFit.cover,
                  )
                : NoPhoto(
                    gender: usersModel.gender,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
