import 'package:house_point_hourglasses/models/house_points.dart';

class HousePointsList {
  List<HousePoints>? data;

  HousePointsList(this.data);

  HousePointsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HousePoints>[];
      json['data'].forEach((v) {
        data?.add(HousePoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (data != null) {
      json['data'] = data?.map((e) => e.toJson()).toList();
    }
    return json;
  }
}
