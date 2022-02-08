import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_point_hourglasses/bloc/house_points_bloc.dart';
import 'package:house_point_hourglasses/presentation/screens/home_page.dart';
import 'package:house_point_hourglasses/repositories/api_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiRepository apiRepository = ApiRepository();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HousePointsBloc>(
        create: (context) => HousePointsBloc(apiRepository),
        child: const HomePage(),
      ),
    );
  }
}
