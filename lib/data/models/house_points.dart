import 'package:flutter/material.dart';

class HousePoints {
  int id;
  double points;
  String name;
  Color houseColor;

  HousePoints({
    required this.houseColor,
    required this.id,
    required this.name,
    required this.points,
  });
}
