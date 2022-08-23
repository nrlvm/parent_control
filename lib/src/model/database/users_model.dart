import 'dart:io';

class UsersModel {
  UsersModel({
    this.id = 0,
    required this.name,
    required this.gender,
    required this.photo,
  });

  int id;
  String gender;
  String name;
  File? photo;

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "photo": photo == null ? null : photo!.path,
      };
}
