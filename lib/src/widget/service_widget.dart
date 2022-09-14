import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:parent_control/src/model/data/service_model.dart';
import 'package:parent_control/src/utils/service_type_util.dart';
import 'package:parent_control/src/utils/utils.dart';

class ServiceWidget extends StatelessWidget {
  final ServiceModelData data;
  final Function() onTap;
  final bool selected;

  const ServiceWidget({
    Key? key,
    required this.onTap,
    required this.data,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceModel model = ServiceModel(
      asset: serviceUtil.getString(data.type).asset,
      text: serviceUtil.getString(data.type).text,
    );
    double h = Utils.height(context);
    double w = Utils.width(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56 * h,
        margin: EdgeInsets.only(left: 16 * w, right: 16 * w, bottom: 8 * h),
        padding: EdgeInsets.only(right: 16 * w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 56 * w,
              child: Center(
                child: Image.asset(
                  'assets/service_icons/${model.asset}.png',
                  fit: BoxFit.none,
                ),
              ),
            ),
            Expanded(
              child: Text(
                model.text,
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16 * h,
                  height: 19 / 16,
                  color: AppColor.dark,
                ),
              ),
            ),
            selected == true
                ? Container(
                    height: 24 * h,
                    width: 24 * h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.dBlue,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/done.svg',
                        color: AppColor.white,
                      ),
                    ),
                  )
                : Container(
                    height: 24 * h,
                    width: 24 * h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColor.dark, width: 2),
                      color: AppColor.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
