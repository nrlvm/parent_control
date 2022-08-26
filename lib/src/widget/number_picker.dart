import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:parent_control/src/utils/utils.dart';

class NumberPickerDialog extends StatefulWidget {
  final Function(int start, int end) change;
  final int start;
  final int end;

  const NumberPickerDialog({
    Key? key,
    required this.change,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  State<NumberPickerDialog> createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  int startHour = 0, endHour = 0;

  @override
  void initState() {
    startHour = widget.start;
    endHour = widget.end;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return SizedBox(
      height: 324 * h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberPicker(
            value: startHour,
            itemCount: 6,
            minValue: 0,
            maxValue: 24,
            onChanged: (v) {
              startHour = v;
              widget.change(startHour,endHour);
              setState(() {});
            },
          ),
          NumberPicker(
            value: endHour,
            itemCount: 6,
            minValue: 0,
            maxValue: 24,
            onChanged: (v) {
              endHour = v;
              widget.change(startHour, endHour);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
