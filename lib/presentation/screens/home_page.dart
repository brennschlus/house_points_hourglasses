import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_point_hourglasses/bloc/house_points_bloc.dart';
import 'package:house_point_hourglasses/models/house_points.dart';
import 'package:house_point_hourglasses/models/house_points_list.dart';
import 'package:house_point_hourglasses/presentation/widgets/house_point_scale.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HousePointsBloc housePointsBloc =
        BlocProvider.of<HousePointsBloc>(context);
    housePointsBloc.add(GetData());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'Факультетские Часы Хогвардса',
              style: GoogleFonts.underdog(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(
                  Radius.circular(1),
                ),
              ),
            ),
            BlocBuilder<HousePointsBloc, HousePointsState>(
                builder: (context, state) {
              if (state is HousePointsLoading) {
                return Expanded(
                  child: Row(
                    children: [
                      HousePointsScale(
                        housePoints: HousePoints(
                            houseColor: "0xFFF44336",
                            id: 0,
                            name: 'Гриффиндор',
                            points: 0),
                      ),
                      HousePointsScale(
                        housePoints: HousePoints(
                            houseColor: "0xFF4CAF50",
                            id: 1,
                            name: 'Гриффиндор',
                            points: 0),
                      ),
                      HousePointsScale(
                        housePoints: HousePoints(
                            houseColor: "0xFFFF9800",
                            id: 2,
                            name: 'Гриффиндор',
                            points: 0),
                      ),
                      HousePointsScale(
                        housePoints: HousePoints(
                            houseColor: "0xFF2196F3",
                            id: 3,
                            name: 'Гриффиндор',
                            points: 0),
                      ),
                    ],
                  ),
                );
              } else if (state is HousePointsLoaded) {
                HousePointsList housePointsList = state.housePointsList;
                List<HousePointsScale> list = List.generate(4, (index) {
                  return HousePointsScale(
                    housePoints: HousePoints(
                        points: housePointsList.data?[index].points,
                        id: housePointsList.data?[index].id,
                        name: housePointsList.data?[index].name,
                        houseColor: housePointsList.data![index].houseColor),
                  );
                });
                return Expanded(child: Row(children: list));
              }
              return Container();
            }),
            Container(
              width: double.infinity,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(
                  Radius.circular(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
