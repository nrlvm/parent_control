class ServiceModelData {
  final int serviceId = 0;
  final int type;
  final int userId;
  int status = 0;

  ServiceModelData({
    required this.type,
    required this.userId,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "user_id": userId,
        "status": status,
      };
}
