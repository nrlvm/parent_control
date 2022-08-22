import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/home_screen/home_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final TextEditingController _controller = TextEditingController();
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: ListView(
        children: [
          SizedBox(
            height: 20 * h,
          ),
          Text(
            'Create your child profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 22 * h,
              height: 26 / 22,
              color: AppColor.white,
            ),
          ),
          SizedBox(
            height: 27 * h,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40 * h,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/photo.svg',
                  ),
                ),
                SizedBox(
                  height: 48 * h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        selectedGender = 'boy';
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72 * h,
                            width: 72 * h,
                            padding: EdgeInsets.only(top: 12 * h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: selectedGender == 'boy'
                                  ? AppColor.blue
                                  : AppColor.grey,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/boy.svg',
                            ),
                          ),
                          SizedBox(
                            height: 8 * h,
                          ),
                          Text(
                            'Boy',
                            style: TextStyle(
                              fontFamily: AppColor.fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 16 * h,
                              height: 19 / 16,
                              color: AppColor.dark,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 38 * w,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedGender = 'girl';
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72 * h,
                            width: 72 * h,
                            padding: EdgeInsets.only(top: 12 * h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: selectedGender == 'girl'
                                  ? AppColor.blue
                                  : AppColor.grey,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/girl.svg',
                            ),
                          ),
                          SizedBox(
                            height: 8 * h,
                          ),
                          Text(
                            'Girl',
                            style: TextStyle(
                              fontFamily: AppColor.fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 16 * h,
                              height: 19 / 16,
                              color: AppColor.dark,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 28 * h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 56 * h,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  padding: EdgeInsets.symmetric(horizontal: 16 * w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.dWhite,
                  ),
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      autocorrect: false,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 16 * h,
                            height: 19 / 16,
                            color: AppColor.dark.withOpacity(0.3),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 152 * h,
                ),
                GestureDetector(
                  onTap: () {
                    dataBaseBlock.allSaveUser(
                      UsersModel(
                        name: _controller.text,
                        gender: selectedGender,
                        photo: '',
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    // DatabaseHelper().clear();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56 * h,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColor.dWhite,
                    ),
                    child: Center(
                      child: Text(
                        'Add child',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 18 * h,
                          height: 21 / 18,
                          color: AppColor.dark.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32 * h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
