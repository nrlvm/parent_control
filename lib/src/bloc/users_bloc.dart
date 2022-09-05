import 'package:parent_control/src/bloc/tasks_bloc.dart';
import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/data/home_model.dart';
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:rxdart/subjects.dart';

class UsersBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchUser = PublishSubject<List<UsersModel>>();
  final _fetchUserInfo = PublishSubject<HomeModel>();

  Stream<List<UsersModel>> get getUser => _fetchUser.stream;

  Stream<HomeModel> get getUserInfo => _fetchUserInfo.stream;

  allUser() async {
    List<UsersModel> getUsers = await dbh.getUsers();
    _fetchUser.sink.add(getUsers);
  }

  allUserInfo(int userId) async {
    List<TaskModel> taskModel = await taskBloc.getTaskTime(userId);
    int allTasksToday = await taskBloc.getTasksToday(userId);
    int leftTasks = await taskBloc.getLeftTask(userId);
    int leftWeekTasks = await taskBloc.getLeftWeekTask(userId);
    List<double> taskCount = await taskBloc.getTaskChartCount(userId);
    HomeModel data = HomeModel(
      taskModel: taskModel,
      allTasksToday: allTasksToday,
      leftTasks: leftTasks,
      leftWeekTasks: leftWeekTasks,
      taskCount: taskCount,
    );
    _fetchUserInfo.sink.add(data);
  }

  Future<bool> isUser() async {
    List<UsersModel> getUsers = await dbh.getUsers();
    if (getUsers.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  allSaveUser(UsersModel data) async {
    await dbh.saveUser(data);
    allUser();
  }

  allUpdateUser(UsersModel data) async {
    await dbh.updateUser(data);
    allUser();
  }

  allDeleteUser(int id) async {
    await dbh.deleteUser(id);
    allUser();
  }
}

final usersBloc = UsersBloc();
