import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/bloc/service_bloc.dart';
import 'package:parent_control/src/bloc/users_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/all_services.dart';

class AddServicesScreen extends StatefulWidget {
  final String name;
  final String photo;
  final String selectedGender;

  const AddServicesScreen({
    Key? key,
    required this.name,
    required this.photo,
    required this.selectedGender,
  }) : super(key: key);

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  List<ServiceModelData> res = [];

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            color: AppColor.white,
            fit: BoxFit.none,
          ),
        ),
        centerTitle: false,
        title: Text(
          'What apps does ${widget.name} use',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 22 * h,
            height: 26 / 22,
            color: AppColor.white,
          ),
        ),
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
                'We will help you track your child\'s activity in the chosen apps',
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
          AllServicesWidget(
            change: (List<ServiceModelData> result) {
              res = [];
              for (int i = 0; i < result.length; i++) {
                if (result[i].status == 1) {
                  res.add(result[i]);
                }
              }
            },
          ),
          GestureDetector(
            onTap: () async {
              await usersBloc.allSaveUser(
                UsersModel(
                  name: widget.name,
                  gender: widget.selectedGender,
                  photo: widget.photo,
                ),
              );
              // for (int i = 0; i < res.length; i++) {
              await serviceBloc.saveServices(res);
              // print(res[i].toJson());
              // }
              Navigator.pushAndRemoveUntil(
                  this.context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (route) => false);

              // serviceBloc.allSaveServices(
              //   ServiceModelData(
              //     type: result,
              //     userId: usersModel.id,
              //     status: 0,
              //   ),
              // );
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 56 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColor.white,
              ),
              child: Center(
                child: Text(
                  'Save',
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
            height: 60 * h,
          ),
        ],
      ),
    );
  }
}
