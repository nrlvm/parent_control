import 'package:parent_control/src/model/database/task_model.dart';

class HomeModel {
  final List<TaskModel> taskModel;
  final int allTasksToday;
  final int leftTasks;
  final int leftWeekTasks;
  final List<double> taskCount;

  HomeModel({
    required this.taskModel,
    required this.allTasksToday,
    required this.leftTasks,
    required this.leftWeekTasks,
    required this.taskCount,
  });
}
