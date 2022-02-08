part of 'house_points_bloc.dart';

abstract class HousePointsEvent extends Equatable {
  const HousePointsEvent();
}

class GetData extends HousePointsEvent {
  @override
  List<Object> get props => [];
}
