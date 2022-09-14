class ServiceModel {
  final String asset;
  final String text;
  bool selected;

  ServiceModel({
    required this.asset,
    required this.text,
    this.selected = false,
  });
}
