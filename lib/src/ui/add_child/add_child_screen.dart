import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/bloc/users_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
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
    Color k;
    if (selectedGender != '' && _controller.text.isNotEmpty) {
      k = AppColor.blue;
    } else {
      k = AppColor.grey;
    }
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
                GestureDetector(
                  onTap: () {
                    pickImage();
                    setState(() {});
                  },
                  child: image == null
                      ? Center(
                          child: SvgPicture.asset(
                            'assets/icons/photo.svg',
                            height: 128 * h,
                            width: 128 * h,
                          ),
                        )
                      : Image.file(
                          image!,
                          height: 128 * h,
                          width: 128 * h,
                          fit: BoxFit.cover,
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
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 152 * h,
                ),
                GestureDetector(
                  onTap: () {
                    usersBloc.allSaveUser(
                      UsersModel(
                        name: _controller.text,
                        gender: selectedGender,
                        photo: image == null ? "" : image!.path,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56 * h,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: k,
                    ),
                    child: Center(
                      child: Text(
                        'Add child',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 18 * h,
                          height: 21 / 18,
                          color: k == AppColor.grey
                              ? AppColor.dark.withOpacity(0.3)
                              : AppColor.white,
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

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick img $e');
    }
  }
}
