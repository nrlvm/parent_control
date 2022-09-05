import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:rxdart/subjects.dart';

class TasksBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchTasks = PublishSubject<List<TaskModel>>();

  Stream<List<TaskModel>> get getTasks => _fetchTasks.stream;

  allTask(int id, DateTime dateTime) async {
    List<TaskModel> getTasks = await dbh.getTasks(id, dateTime);
    _fetchTasks.sink.add(getTasks);
  }

  saveTask(TaskModel data, DateTime dateTime) async {
    await dbh.saveTask(data);
    allTask(usersModel.id, dateTime);
  }

  updateTask(TaskModel data, DateTime dateTime) async {
    await dbh.updateTask(data);
    allTask(usersModel.id, dateTime);
  }

  Future<List<TaskModel>> getTaskTime(int userId) async {
    List<TaskModel> list = await dbh.getTaskToday(userId);
    DateTime timeNow = DateTime.now();
    List<TaskModel> finalData = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].start <= timeNow.hour && timeNow.hour <= list[i].end) {
        TaskModel data = TaskModel(
          color: list[i].color,
          userId: list[i].userId,
          year: list[i].year,
          month: list[i].month,
          day: list[i].day,
          start: list[i].start,
          end: list[i].end,
          title: list[i].title,
        );
        finalData.add(data);
      }
    }
    return finalData;
  }

  Future<int> getLeftTask(int userId) async {
    List<TaskModel> list = await dbh.getTaskToday(userId);
    DateTime timeNow = DateTime.now();
    int counter = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].start > timeNow.hour) {
        counter++;
      }
    }
    return counter;
  }

  Future<int> getTasksToday(int userId) async {
    int counter = 0;
    List<TaskModel> list = await dbh.getTaskToday(userId);
    counter = list.length;
    return counter;
  }

  Future<List<double>> getTaskChartCount(int userId) async {
    List<double> taskCount = [];
    DateTime firstDate = DateTime.now();
    for (int i = 0; i < 7; i++) {
      List<TaskModel> database = await dbh.getLeftWeekTask(
        userId,
        firstDate.add(
          Duration(days: i),
        ),
      );
      taskCount.add(database.length.toDouble());
    }
    return taskCount;
  }

  Future<int> getLeftWeekTask(int userId) async {
    DateTime now = DateTime.now();
    int counter = 0;
    DateTime firstDate = getDate(now.subtract(Duration(days: now.weekday - 1)));
    for (int i = 0; i < 7; i++) {
      List<TaskModel> database = await dbh.getLeftWeekTask(
        userId,
        firstDate.add(
          Duration(days: i),
        ),
      );
      for (int j = 0; j < database.length; j++) {
        DateTime dateTime = DateTime(
          database[j].year,
          database[j].month,
          database[j].day,
          database[j].end,
        );
        if (dateTime.isAfter(now)) {
          counter++;
        }
      }
    }
    return counter;
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
}

final taskBloc = TasksBloc();
