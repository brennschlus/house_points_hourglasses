import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_point_hourglasses/data/models/house_points.dart';
import 'package:house_point_hourglasses/presentation/widgets/house_point_scale.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Row(
                children: [
                  HousePointsScale(
                    housePoints: HousePoints(
                        houseColor: Colors.green,
                        id: 0,
                        name: 'Гриффиндор',
                        points: 0),
                  ),
                  HousePointsScale(
                    housePoints: HousePoints(
                        houseColor: Colors.blue,
                        id: 1,
                        name: 'Гриффиндор',
                        points: 0),
                  ),
                  HousePointsScale(
                    housePoints: HousePoints(
                        houseColor: Colors.red,
                        id: 2,
                        name: 'Гриффиндор',
                        points: 0),
                  ),
                  HousePointsScale(
                    housePoints: HousePoints(
                        houseColor: Colors.orange,
                        id: 3,
                        name: 'Гриффиндор',
                        points: 0),
                  ),
                ],
              ),
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
          ],
        ),
      ),
    );
  }
}
