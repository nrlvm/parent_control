import 'package:flutter/material.dart';
import 'package:parent_control/src/bloc/tasks_bloc.dart';
import 'package:parent_control/src/bloc/users_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/circle_widget.dart';
import 'package:parent_control/src/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  bool isFirst = false;
  int currentPage = 0;
  List<TaskModel> taskModel = [];
  @override
  initState() {
    usersBloc.allUser();
    getTime();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  getTime() async {
    taskModel = await taskBloc.getTaskTime();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: StreamBuilder<List<UsersModel>>(
        stream: usersBloc.getUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UsersModel> userData = snapshot.data!;
            if (!isFirst) {
              usersModel = userData[0];
              isFirst = true;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 59 * h,
                ),
                Center(
                  child: Text(
                    'Home',
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
                  height: 27 * h,
                ),
                SizedBox(
                  height: 570 * h,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      usersModel = userData[index];
                    },
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        userModel: userData[index],
                        taskModel: taskModel
                      );
                    },
                    itemCount: userData.length,
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                SizedBox(
                  height: 8 * h,
                  child: CircleWidget(
                    controlPage: currentPage,
                    length: userData.length,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('error occurred'),
            );
          }
        },
      ),
    );
  }
}
