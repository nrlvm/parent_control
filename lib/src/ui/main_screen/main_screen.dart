import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/main_screen/alert/alert_screen.dart';
import 'package:parent_control/src/ui/main_screen/home_screen/home_screen.dart';
import 'package:parent_control/src/ui/main_screen/setting/setting_screen.dart';
import 'package:parent_control/src/ui/main_screen/tasks/task_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

late UsersModel usersModel;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      body: const [
        HomeScreen(),
        TaskScreen(),
        AlertScreen(),
        SettingScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.lBlue,
        selectedLabelStyle: TextStyle(
          fontFamily: AppColor.fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 12 * h,
          height: 15 / 10,
          letterSpacing: 0.5,
          color: AppColor.blue,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppColor.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 10 * h,
          height: 15 / 10,
          letterSpacing: 0.5,
          color: AppColor.grey,
        ),
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/main_icons/m1.svg',
              color: _selectedIndex == 0 ? AppColor.lBlue : AppColor.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/main_icons/m2.svg',
              color: _selectedIndex == 1 ? AppColor.lBlue : AppColor.grey,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/main_icons/m3.svg',
              color: _selectedIndex == 2 ? AppColor.lBlue : AppColor.grey,
            ),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/main_icons/m4.svg',
              color: _selectedIndex == 3 ? AppColor.lBlue : AppColor.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}