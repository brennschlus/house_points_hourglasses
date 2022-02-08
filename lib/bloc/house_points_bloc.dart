import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:house_point_hourglasses/models/house_points_list.dart';
import 'package:house_point_hourglasses/repositories/api_repository.dart';

part 'house_points_event.dart';
part 'house_points_state.dart';

class HousePointsBloc extends Bloc<HousePointsEvent, HousePointsState> {
  ApiRepository apiRepository = ApiRepository();

  HousePointsBloc(this.apiRepository) : super(HousePointsInitial()) {
    on<HousePointsEvent>((event, emit) async {
      emit(const HousePointsLoading());

      final housePointsList = await apiRepository.fetchData();
      emit(HousePointsLoaded(housePointsList));
    });
  }
}
