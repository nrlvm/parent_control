import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    dataBaseBlock.allUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: StreamBuilder<List<UsersModel>>(
        stream: dataBaseBlock.getUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UsersModel> data = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 59 * h,
                ),
                Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 22 * h,
                      height: 26 / 22,
                      color: AppColor.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 27 * h,
                ),
                SizedBox(
                  height: 570 * h,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return HomeWidget(data: data[index]);
                    },
                    itemCount: data.length,
                  ),
                ),
                SizedBox(
                  height: 12 * h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddChildScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 56 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.dark,
                    ),
                    child: Center(
                      child: Text(
                        'Add Another Child',
                        style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 16 * h,
                            height: 19 / 16,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('error occurred'),
            );
          }
        },
      ),
    );
  }
}
