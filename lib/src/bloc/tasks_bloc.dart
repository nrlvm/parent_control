import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:rxdart/subjects.dart';

class TasksBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchTasks = PublishSubject<List<TaskModel>>();

  Stream<List<TaskModel>> get getTasks => _fetchTasks.stream;

  allTask() async {
    List<TaskModel> getTasks = await dbh.getTasks();
    _fetchTasks.sink.add(getTasks);
  }

  saveTask(TaskModel data) async {
    await dbh.saveTask(data);
    allTask();
  }
}
final taskBloc = TasksBloc();