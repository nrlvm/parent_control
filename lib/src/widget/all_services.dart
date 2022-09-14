import 'package:flutter/material.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/widget/service_widget.dart';

class AllServicesWidget extends StatefulWidget {
  final Function(List<ServiceModelData> result) change;

  const AllServicesWidget({
    Key? key,
    required this.change,
  }) : super(key: key);

  @override
  State<AllServicesWidget> createState() => _AllServicesWidgetState();
}

class _AllServicesWidgetState extends State<AllServicesWidget> {
  bool selected = false;
  int selectedIndex = -1;
  List<ServiceModelData> data = [
    ServiceModelData(type: 0, userId: usersModel?.id ?? 0, status: 0),
    ServiceModelData(type: 1, userId: usersModel?.id ?? 0, status: 0),
    ServiceModelData(type: 2, userId: usersModel?.id ?? 0, status: 0),
    ServiceModelData(type: 3, userId: usersModel?.id ?? 0, status: 0),
    ServiceModelData(type: 4, userId: usersModel?.id ?? 0, status: 0),
    ServiceModelData(type: 5, userId: usersModel?.id ?? 0, status: 0),
  ];
  List<ServiceModelData> result = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ServiceWidget(
            selected: data[index].status == 1,
            data: data[index],
            onTap: () {
              data[index].status == 1
                  ? data[index].status = 0
                  : data[index].status = 1;
              // if (data[index].status == 1) {
              //   data[index].status == 0;
              // } else {
              //   data[index].status == 1;
              // }

              // selectedIndex = index;
              // if (selectedIndex == index) {
              //   selected == true;
              //   data[index].status = 1;
              // } else {
              //   selected == false;
              //   data[index].status = 0;
              // }
              // selected = !selected;
              setState(() {});
              widget.change(data);
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
