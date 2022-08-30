import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeTaskWidget extends StatelessWidget {
  final TaskModel data;

  const HomeTaskWidget({Key? key, required this.data}) : super(key: key);

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
    return data.toJson().isNotEmpty
        ? Container(
            width: 156 * w,
            height: 26 * h,
            margin: EdgeInsets.only(left: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colors[data.color],
              border: Border.all(
                color: colors[data.color] == const Color(0xFFFFFFFF)
                    ? AppColor.grey
                    : Colors.transparent,
              ),
            ),
            child: Center(
              child: Text('${data.title} ${data.start} - ${data.end}'),
            ),
          )
        : const SizedBox();
  }
}
