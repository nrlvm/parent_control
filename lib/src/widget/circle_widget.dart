import 'package:flutter/material.dart';
import 'package:parent_control/src/utils/utils.dart';

class CircleWidget extends StatelessWidget {
  final int controlPage;
  final int length;

  const CircleWidget({
    Key? key,
    required this.controlPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              height: controlPage == index ? 8 * h : 4 * h,
              width: controlPage == index ? 8 * h : 4 * h,
              margin: EdgeInsets.symmetric(horizontal: 4 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: length,
      ),
    );
  }
}
