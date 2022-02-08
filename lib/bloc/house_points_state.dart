part of 'house_points_bloc.dart';

abstract class HousePointsState extends Equatable {
  const HousePointsState();

  @override
  List<Object> get props => [];
}

class HousePointsInitial extends HousePointsState {}

class HousePointsLoading extends HousePointsState {
  const HousePointsLoading();

  @override
  List<Object> get props => [];
}

class HousePointsLoaded extends HousePointsState {
  final HousePointsList housePointsList;
  const HousePointsLoaded(this.housePointsList);

  @override
  List<Object> get props => [housePointsList];
}
