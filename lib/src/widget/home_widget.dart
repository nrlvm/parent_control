import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';

class HomeWidget extends StatelessWidget {
  final UsersModel data;

  const HomeWidget({Key? key, required this.data}) : super(key: key);

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
        children: [
          SizedBox(
            height: 160 * h,
            width: 343 * w,
            child: Stack(
              children: [
                data.photo == ""
                    ? NoPhoto(gender: data.gender)
                    : Image.file(
                        File(data.photo),
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
                        data.name,
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
          )
        ],
      ),
    );
  }
}
