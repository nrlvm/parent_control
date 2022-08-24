import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class NoPhoto extends StatelessWidget {
  final String gender;
  final bool main;

  const NoPhoto({
    Key? key,
    required this.gender,
    required this.main,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return main == true
        ? Stack(
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
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              gender == 'boy'
                  ? 'assets/icons/np_man.svg'
                  : 'assets/icons/np_woman.svg',
              height: 48 * h,
              width: 48 * h,
              fit: BoxFit.cover,
            ),
          );
  }
}
