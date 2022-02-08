import 'package:house_point_hourglasses/data/api_provider.dart';
import 'package:house_point_hourglasses/models/house_points_list.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<HousePointsList> fetchData() {
    return _provider.fetchData();
  }
}

class NetworkError extends Error {}
