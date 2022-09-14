import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:rxdart/subjects.dart';

class ServiceBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchServices = PublishSubject<List<ServiceModelData>>();

  Stream<List<ServiceModelData>> get getServices => _fetchServices.stream;

  Future<int> allSaveServices(ServiceModelData data) async {
    int userId = await dbh.saveServices(data);
    return userId;
  }
}

final serviceBloc = ServiceBloc();
