import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class NoPhoto extends StatelessWidget {
  final String gender;

  const NoPhoto({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Stack(
      children: [
        Container(
          height: 160 * h,
          width: 343 * w,
          color: AppColor.white,
        ),
        Positioned(
          left: 149 * h,
          top: 24 * h,
          child: gender == 'boy'
              ? SvgPicture.asset(
                  'assets/icons/boy.svg',
                  color: AppColor.grey,
                  width: 136 * w,
                  height: 136 * h,
                )
              : SvgPicture.asset(
                  'assets/icons/girl.svg',
                  color: AppColor.grey,
                  width: 136 * w,
                  height: 136 * h,
                ),
        ),
      ],
    );
  }
}
