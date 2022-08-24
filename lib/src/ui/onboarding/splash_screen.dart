import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parent_control/src/bloc/users_bloc.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/ui/onboarding/onboard_all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    _splashToOnboarding();
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/onboard/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _splashToOnboarding() async {
    bool user = await usersBloc.isUser();
    timer = Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => !user
                ? const OnboardAll()
                : const MainScreen(),
          ),
        );
      },
    );
  }
}
