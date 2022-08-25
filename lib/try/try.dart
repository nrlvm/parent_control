// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TryDate extends StatefulWidget {
//   const TryDate({Key? key}) : super(key: key);
//
//   @override
//   State<TryDate> createState() => _TryDateState();
// }
//
// class _TryDateState extends State<TryDate> {
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = TimeOfDay.now();
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         _buildTimePick("Start", true, startTime, (x) {
//           setState(() {
//             startTime = x;
//             print("The picked time is: $x");
//           });
//         }),
//         const SizedBox(height: 10),
//         _buildTimePick(
//           "End",
//           true,
//           endTime,
//           (x) {
//             setState(
//               () {
//                 endTime = x;
//                 print("The picked time is: $x");
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
// Future selectedTime(BuildContext context, bool ifPickedTime,
//     TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
//   var _pickedTime =
//   await showTimePicker(context: context, initialTime: initialTime);
//   if (_pickedTime != null) {
//     onTimePicked(_pickedTime);
//   }
// }
//
// Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
//     Function(TimeOfDay) onTimePicked) {
//   return Row(
//     children: [
//       SizedBox(
//         width: 80,
//         child: Text(
//           title,
//         ),
//       ),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: GestureDetector(
//           child: Text(
//             currentTime.format(context),
//           ),
//           onTap: () {
//             selectedTime(context, ifPickedTime, currentTime, onTimePicked);
//           },
//         ),
//       ),
//     ],
//   );
// }
// }
