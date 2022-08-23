import 'package:flutter/material.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/ui/main_screen/home_screen/home_screen.dart';
import 'package:parent_control/src/ui/onboarding/splash_screen.dart';
import 'package:parent_control/src/widget/home_widget.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:parent_control/try/try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}

