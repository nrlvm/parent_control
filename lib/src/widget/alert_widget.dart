import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:parent_control/src/model/data/service_model.dart';
import 'package:parent_control/src/utils/service_type_util.dart';
import 'package:parent_control/src/utils/utils.dart';

class AlertWidget extends StatelessWidget {
  final ServiceModelData data;

  const AlertWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceModel model = ServiceModel(
      asset: serviceUtil.getString(data.type).asset,
      text: serviceUtil.getString(data.type).text,
    );
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 56 * h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 16 * w, right: 16 * w, bottom: 8 * h),
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
      ),
      child: Row(
        children: [
          Image.asset('assets/service_icons/${model.asset}.png'),
          SizedBox(
            width: 24 * w,
          ),
          Expanded(
            child: Text(
              '1 hour',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 16 * h,
                color: AppColor.dark,
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/dislike.svg'),
          SizedBox(
            width: 16 * w,
          ),
          SvgPicture.asset('assets/icons/like.svg'),
        ],
      ),
    );
  }
}
