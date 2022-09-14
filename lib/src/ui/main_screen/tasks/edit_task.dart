import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/bloc/tasks_bloc.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:parent_control/src/utils/date_util.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/color_picker.dart';
import 'package:parent_control/src/widget/no_photo_widget.dart';
import 'package:parent_control/src/widget/number_picker.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel data;
  final DateTime dateTime;

  const EditTaskScreen({
    Key? key,
    required this.data,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController controller = TextEditingController();

  int selectedIndex = -1;

  List<Color> colors = const [
    Color(0xFFFFFFFF),
    Color(0xFFECECEC),
    Color(0xFF9BEDFF),
    Color(0xFFA9FFA3),
    Color(0xFFFCFF82),
    Color(0xFFFFAAAA),
    Color(0xFFFF8BE6),
    Color(0xFFD187FF),
    Color(0xFFA2A0FF),
    Color(0xFF6B7AFF),
  ];

  @override
  void initState() {
    controller.text = widget.data.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        elevation: 0,
        title: Text('Tasks ${usersModel!.name}'),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: usersModel!.photo != ""
                ? Image.file(
                    File(usersModel!.photo),
                    height: 48 * h,
                    width: 48 * h,
                    fit: BoxFit.cover,
                  )
                : NoPhoto(
                    gender: usersModel!.gender,
                    main: false,
                  ),
          ),
          SizedBox(
            width: 16 * w,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16 * h,
          ),
          Expanded(
            child: Container(
              height: 592 * h,
              width: MediaQuery.of(context).size.width,
              margin:
                  EdgeInsets.only(left: 16 * w, right: 16 * w, bottom: 108 * h),
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25 * h,
                  ),
                  Center(
                    child: Text(
                      '${dateUtil.getToString(widget.data.month)} ${widget.data.day}, ${widget.data.year}',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 16 * h,
                        height: 19 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * h,
                  ),
                  Container(
                    height: 56 * h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16 * h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.dWhite,
                    ),
                    child: Center(
                      child: TextField(
                        controller: controller,
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 16 * h,
                          height: 19 / 16,
                          color: AppColor.dark,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return NumberPickerDialog(
                            start: widget.data.start,
                            end: widget.data.end,
                            change: (int start, int end) {
                              setState(
                                () {
                                  widget.data.start = start;
                                  widget.data.end = end;
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 56 * h,
                          width: 156 * w,
                          padding: EdgeInsets.symmetric(horizontal: 16 * w),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: AppColor.grey,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/set_start.svg'),
                              SizedBox(
                                width: 8 * w,
                              ),
                              Text(
                                widget.data.start.toString(),
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16 * h,
                                  height: 19 / 16,
                                  color: AppColor.dark,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/icons/arrow_down.svg'),
                            ],
                          ),
                        ),
                        Container(
                          width: 155 * w,
                          height: 56 * h,
                          padding: EdgeInsets.symmetric(horizontal: 16 * w),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: AppColor.grey,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/set_start.svg'),
                              SizedBox(
                                width: 8 * w,
                              ),
                              Text(
                                widget.data.end.toString(),
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16 * h,
                                  height: 19 / 16,
                                  color: AppColor.dark,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/icons/arrow_down.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8 * h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ColorPicker(
                          selectedIndex: widget.data.color,
                          change: (int index) {
                            setState(
                              () {
                                widget.data.color = index;
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 16 * w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 24 * h,
                            width: 24 * h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              // ignore: unrelated_type_equality_checks
                              color: colors[widget.data.color],
                              border: selectedIndex == 0
                                  ? Border.all(
                                      color: AppColor.grey,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(
                            width: 16 * w,
                          ),
                          Text(
                            widget.data.color == -1 ? 'Default color' : 'Color',
                            style: TextStyle(
                              fontFamily: AppColor.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 16 * h,
                              height: 19 / 16,
                              color: AppColor.dark,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/arrow_down.svg'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 248 * h,
                  ),
                  GestureDetector(
                    onTap: () {
                      taskBloc.updateTask(
                        TaskModel(
                          color: widget.data.color,
                          userId: widget.data.userId,
                          year: widget.data.year,
                          month: widget.data.month,
                          day: widget.data.day,
                          start: widget.data.start,
                          end: widget.data.end,
                          title: controller.text,
                        ),
                        widget.dateTime,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 40 * w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: controller.text == ''
                            ? AppColor.grey
                            : AppColor.dBlue,
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18 * h,
                            height: 21 / 18,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
