class ServiceModelData {
  final int serviceId = 0;
  final int type;
  final int userId;
  bool liked;
  bool disliked ;
  int status = 0;

  ServiceModelData({
    required this.type,
    required this.userId,
    required this.status,
    this.liked = false,
    this.disliked = false,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "user_id": userId,
        "status": status,
      };
}
