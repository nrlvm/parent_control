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
    for(int i = 0; i < list.length; i ++){
      if (list[i].start <= timeNow.hour &&
          timeNow.hour <= list[i].end) {
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



  Future<int> getLeftTask(int userId)async{
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

}

final taskBloc = TasksBloc();
