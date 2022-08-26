import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:rxdart/subjects.dart';

class TasksBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchTasks = PublishSubject<List<TaskModel>>();

  Stream<List<TaskModel>> get getTasks => _fetchTasks.stream;

  allTask(int id) async {
    List<TaskModel> getTasks = await dbh.getTasks(id);
    _fetchTasks.sink.add(getTasks);
  }

  saveTask(TaskModel data) async {
    await dbh.saveTask(data);
    allTask(usersModel.id);
  }
}

final taskBloc = TasksBloc();
