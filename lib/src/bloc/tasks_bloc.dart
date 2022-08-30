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

  Future<List<TaskModel>> getTaskTime() async {
    List<TaskModel> data = await dbh.getTaskTime();
    return data;
  }
}

final taskBloc = TasksBloc();
