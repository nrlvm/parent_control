import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parent_control/src/bloc/tasks_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/ui/main_screen/tasks/add_task.dart';
import 'package:parent_control/src/ui/main_screen/tasks/edit_task.dart';
import 'package:parent_control/src/utils/date_util.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:parent_control/src/widget/task_widget.dart';
import 'package:parent_control/src/widget/weekday_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    taskBloc.allTask(usersModel!.id, selectedDate);
    super.initState();
  }

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
        title: Text('Tasks ${usersModel!.name}'),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: usersModel!.photo != ""
                ? Image.file(
                    File(usersModel!.photo),
                    height: 48 * h,
                    width: 48 * h,
                    fit: BoxFit.cover,
                  )
                : NoPhoto(
                    gender: usersModel!.gender,
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
                bottom: 24 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  WeekdayWidget(
                    selectedIndex: selectedIndex,
                    change: (int index) {
                      selectedIndex = index;
                      selectedDate = DateTime.now().add(Duration(days: index));
                      taskBloc.allTask(usersModel!.id, selectedDate);
                      setState(() {});
                    },
                  ),
                  Center(
                    child: Text(
                      '${dateUtil.getToString(selectedDate.month)} ${selectedDate.day}, ${selectedDate.year}',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<TaskModel>>(
                      stream: taskBloc.getTasks,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<TaskModel> data = snapshot.data!;
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return TaskWidget(
                                data: data[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditTaskScreen(
                                        data: data[index],
                                        dateTime: selectedDate,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            itemCount: data.length,
                          );
                        }
                        return const Text('error');
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(
                            dateTime: selectedDate,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: 40 * h,
                        vertical: 12 * h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: AppColor.dBlue,
                      ),
                      child: Center(
                        child: Text(
                          '+Add Task',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
