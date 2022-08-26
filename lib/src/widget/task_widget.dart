import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel data;

  const TaskWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = const [
      Color(0xFFFFFFFF),
      Color(0xFFECECEC),
      Color(0xFF9BEDFF),
      Color(0xFFA9FFA3),
      Color(0xFFFCFF82),
      Color(0xFFFFAAAA),
      Color(0xFFFF8BE6),
      Color(0xFFD187FF),
      Color(0xFFA2A0FF),
      Color(0xFF6B7AFF),
    ];
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 56 * h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 16 * w, right: 16 * w, top: 8 * h),
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors[data.color],
        border:
            data.color == 0 ? Border.all(color: AppColor.grey) : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              data.title,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 16 * h,
                height: 19 / 16,
                color: AppColor.dark,
              ),
            ),
          ),
          Text(
            '${data.start} - ${data.end}',
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 16 * h,
              height: 19 / 16,
              color: AppColor.dark,
            ),
          ),
          SizedBox(
            width: 6 * w,
          ),
          SvgPicture.asset(
            'assets/icons/arrow_right.svg',
          ),
        ],
      ),
    );
  }
}
