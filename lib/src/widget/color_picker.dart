import 'package:flutter/cupertino.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:parent_control/src/widget/select_color_widget.dart';

class ColorPicker extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) change;

  const ColorPicker({
    Key? key,
    required this.selectedIndex,
    required this.change,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int gridCount = 5;
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
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return SizedBox(
      height: 290 * h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 27 * h,
          ),
          Text(
            'Color for task background',
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 16 * h,
              height: 19 / 16,
              color: AppColor.dark,
            ),
          ),
          SizedBox(
            height: 43 * h,
          ),
          SizedBox(
            height: 128 * h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 15 * w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SelectColorWidget(
                          selected: selectedIndex == index * gridCount,
                          color: colors[index * gridCount],
                          onTap: () {
                            setState(() {
                              selectedIndex = index * gridCount;
                              widget.change(selectedIndex);
                            });
                          },
                        ),
                        index * gridCount + 1 >= colors.length
                            ? Container()
                            : SelectColorWidget(
                                selected:
                                    selectedIndex == index * gridCount + 1,
                                color: colors[index * gridCount + 1],
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index * gridCount + 1;
                                    widget.change(selectedIndex);
                                  });
                                },
                              ),
                        index * gridCount + 2 >= colors.length
                            ? Container()
                            : SelectColorWidget(
                                selected:
                                    selectedIndex == index * gridCount + 2,
                                color: colors[index * gridCount + 2],
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index * gridCount + 2;
                                    widget.change(selectedIndex);
                                  });
                                },
                              ),
                        index * gridCount + 3 >= colors.length
                            ? Container()
                            : SelectColorWidget(
                                selected:
                                    selectedIndex == index * gridCount + 3,
                                color: colors[index * gridCount + 3],
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index * gridCount + 3;
                                    widget.change(selectedIndex);
                                  });
                                },
                              ),
                        index * gridCount + 4 >= colors.length
                            ? Container()
                            : SelectColorWidget(
                                selected:
                                    selectedIndex == index * gridCount + 4,
                                color: colors[index * gridCount + 4],
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index * gridCount + 4;
                                    widget.change(selectedIndex);
                                  });
                                },
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 16 * h,
                    )
                  ],
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
