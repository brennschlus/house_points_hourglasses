import 'package:dio/dio.dart';
import 'package:house_point_hourglasses/models/house_points_list.dart';

const String _url = "http://10.0.2.2:8080/faculties";

class ApiProvider {
  final Dio _dio = Dio();

  Future<HousePointsList> fetchData() async {
    Response response = await _dio.get(_url);

    return HousePointsList.fromJson(response.data);
  }
}
