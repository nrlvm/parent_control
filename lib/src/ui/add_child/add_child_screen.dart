import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/ui/add_child/add_services.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final TextEditingController _controller = TextEditingController();
  String selectedGender = '';

  // Color k = AppColor.grey;
  bool ready = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty && selectedGender != '') {
        ready = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Color k;
    // if (selectedGender != '' && _controller.text.isNotEmpty) {
    //   k = AppColor.blue;
    // } else {
    //   k = AppColor.grey;
    // }
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
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
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            image!,
                            height: 128 * h,
                            width: 128 * h,
                            fit: BoxFit.cover,
                          ),
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
                        if (_controller.text.isNotEmpty) {
                          ready = true;
                        } else {
                          ready = false;
                        }
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
                        if (_controller.text.isNotEmpty) {
                          ready = true;
                        } else {
                          ready = false;
                        }
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
                      // onEditingComplete: () {
                      //   if (_controller.text.isNotEmpty &&
                      //       selectedGender != '') {
                      //     ready = true;
                      //   } else {
                      //     ready = false;
                      //   }
                      //   setState(() {});
                      // },
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
                  onTap: () async {
                    // int userId = await usersBloc.allSaveUser(
                    //   UsersModel(
                    //     name: _controller.text,
                    //     gender: selectedGender,
                    //     photo: image == null ? "" : image!.path,
                    //   ),
                    // );
                    // Navigator.pushReplacement(
                    //   this.context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MainScreen(),
                    //   ),
                    // );
                    if (ready) {
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddServicesScreen(
                            name: _controller.text,
                            photo: image == null ? '' : image!.path,
                            selectedGender: selectedGender,
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 370),
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width,
                    height: 56 * h,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: ready ? AppColor.blue : AppColor.grey,
                    ),
                    child: Center(
                      child: Text(
                        'Add child',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 18 * h,
                          height: 21 / 18,
                          color: !ready
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
