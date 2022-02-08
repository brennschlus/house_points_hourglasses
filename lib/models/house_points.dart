class HousePoints {
  int? id;
  double? points = 0;
  String? name;
  String houseColor = "0xFF42A5F5";

  HousePoints({
    required this.houseColor,
    required this.id,
    required this.name,
    required this.points,
  });

  HousePoints.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    id = json['id'];
    points = json['score']!.toDouble() * 0.01;
    houseColor = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['score'] = points!.toInt() * 100;
    data['color'] = houseColor;
    return data;
  }
}
