class TaskModel {
  int id = 0;
  int color;
  int userId;
  int year;
  int month;
  int day;
  int start;
  int end;
  String title;

  TaskModel({
    required this.color,
    required this.userId,
    required this.year,
    required this.month,
    required this.day,
    required this.start,
    required this.end,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "start": start,
        "end": end,
        "color": color,
        "title": title,
        "user_id": userId,
      };
}
