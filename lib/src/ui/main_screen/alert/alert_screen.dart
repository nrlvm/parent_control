import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parent_control/src/bloc/service_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/alert_widget.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List<ServiceModelData> data = [];

  @override
  void initState() {
    getServices(usersModel!.id);
    super.initState();
  }

  int selectedIndex = -1;

  Future<List<ServiceModelData>> getServices(int userId) async {
    data = await serviceBloc.showServices(userId);
    setState(() {});
    return data;
  }

  int dislikeCounter = 0;
  int likeCounter = 0;

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
        title: Text('Alerts ${usersModel!.name}'),
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
          Container(
            height: 72 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.yellow,
            ),
            child: Center(
              child: Text(
                'At the end of the day, ask your child about his '
                'impressions on the Internet for the past day',
                textAlign: TextAlign.center,
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
          SizedBox(
            height: 16 * h,
          ),
          Expanded(
            child: StreamBuilder<List<ServiceModelData>>(
              stream: serviceBloc.getServices,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ServiceModelData> data = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AlertWidget(
                        data: data[index],
                        dislike: () async {
                          data[index].disliked = !data[index].disliked;
                          dislikeCounter = 0;
                          for (int i = 0; i < data.length; i++) {
                            if (data[i].disliked) {
                              dislikeCounter += 1;
                            }
                          }
                          print('dislike $dislikeCounter');
                          print('userId ${usersModel!.id}');

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt(
                              '${usersModel!.id} DISLIKES', dislikeCounter);
                          setState(() {});
                        },
                        like: () async {
                          data[index].liked = !data[index].liked;
                          likeCounter = 0;
                          for (int i = 0; i < data.length; i++) {
                            if (data[i].liked) {
                              likeCounter += 1;
                            }
                          }
                          print(' likes $likeCounter');
                          print('userId ${usersModel!.id}');
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt('${usersModel!.id} LIKES', likeCounter);
                          setState(() {});
                        },

                        // data: getServices(usersModel!.id),
                      );
                    },
                    itemCount: data.length,
                  );
                } else {
                  // print(' data alert screen ${snapshot.data}');
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
