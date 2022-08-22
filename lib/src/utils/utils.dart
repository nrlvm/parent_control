import 'package:flutter/material.dart';

class Utils {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height / 812;
  }
}

