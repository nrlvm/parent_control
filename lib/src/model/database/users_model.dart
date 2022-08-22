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
  String photo;

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "photo": photo,
      };
}
