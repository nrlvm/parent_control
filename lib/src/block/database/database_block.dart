import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:rxdart/subjects.dart';

class DataBaseBlock {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchUser = PublishSubject<List<UsersModel>>();

  Stream<List<UsersModel>> get getUser => _fetchUser.stream;

  allUser() async {
    List<UsersModel> getUsers = await dbh.getUsers();
    _fetchUser.sink.add(getUsers);
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
