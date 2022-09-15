import 'package:parent_control/src/database/database_helper.dart';
import 'package:parent_control/src/model/data/service_database.dart';
import 'package:rxdart/subjects.dart';

class ServiceBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchServices = PublishSubject<List<ServiceModelData>>();

  Stream<List<ServiceModelData>> get getServices => _fetchServices.stream;

  Future<int> saveServices(ServiceModelData data) async {
    _fetchServices.sink.add(data);
    int userId = await dbh.saveServices(data);
    return userId;
  }

  Future<List<ServiceModelData>> showServices(int userId) async {
    List<ServiceModelData> data = await dbh.getServices(userId);
    _fetchServices.sink.add(data);
    return data;
  }
}

final serviceBloc = ServiceBloc();
