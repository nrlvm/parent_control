import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class SelectColorWidget extends StatelessWidget {
  final bool selected;
  final Color color;
  final Function() onTap;

  const SelectColorWidget({
    Key? key,
    required this.color,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 56 * h,
        width: 56 * h,
        margin: EdgeInsets.only(
          right: 16 * w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: color,
          border: selected == true
              ? Border.all(color: AppColor.blue, width: 2)
              : Border.all(color: AppColor.grey, width: 2),
        ),
      ),
    );
  }
}
