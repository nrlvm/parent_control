import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class ImagePic extends StatefulWidget {
  const ImagePic({Key? key}) : super(key: key);

  @override
  State<ImagePic> createState() => _ImagePicState();
}

class _ImagePicState extends State<ImagePic> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Column(
        children: [
          SizedBox(
            height: 50 * h,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  height: 120 * h,
                  width: 120 * w,
                  color: AppColor.yellow,
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 50 * h,
          ),
          image == null
              ? const SizedBox()
              : Image.file(
                  image!,
                  height: 160 * h,
                  width: 160 * h,
                  fit: BoxFit.cover,
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
