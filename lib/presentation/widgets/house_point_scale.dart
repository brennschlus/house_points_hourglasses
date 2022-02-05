import 'package:flutter/material.dart';
import 'package:house_point_hourglasses/data/models/house_points.dart';

class HousePointsScale extends StatefulWidget {
  final HousePoints housePoints;

  const HousePointsScale({
    Key? key,
    required this.housePoints,
  }) : super(key: key);

  @override
  State<HousePointsScale> createState() => _HousePointsScaleState();
}

class _HousePointsScaleState extends State<HousePointsScale> {
  double points = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.housePoints.houseColor,
                    border: const Border(
                      top: BorderSide(color: Colors.yellow, width: 6),
                      left: BorderSide(color: Colors.yellow, width: 6),
                      right: BorderSide(color: Colors.yellow, width: 6),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: CustomPaint(
                size: Size.infinite,
                painter: MiddlePart(widget.housePoints.houseColor),
              ),
            ),
            Flexible(
              flex: 9,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: widget.housePoints.points,
                    child: Container(
                      color: widget.housePoints.houseColor,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.yellow, width: 6),
                      left: BorderSide(color: Colors.yellow, width: 6),
                      right: BorderSide(color: Colors.yellow, width: 6),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  displayDialog(context);
                },
                child: const Text('Изменить'),
              ),
            )
          ],
        ),
      ),
    );
  }

  displayDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: const Text('Прибавить или отнять очки?'),
            elevation: 10,
            backgroundColor: Colors.green,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      widget.housePoints.points -= 0.1;
                    },
                  );
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      widget.housePoints.points += 0.1;
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MiddlePart extends CustomPainter {
  Color houseColor;
  MiddlePart(this.houseColor);
  @override
  void paint(Canvas canvas, Size size) {
    final paintBorder = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final paintInside = Paint()
      ..color = houseColor
      ..style = PaintingStyle.fill;

    final borderLine = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2.2, size.height / 2)
      ..lineTo(0, size.height)
      ..moveTo(size.width, 0)
      ..lineTo(size.width / 1.8, size.height / 2)
      ..lineTo(size.width, size.height);

    final insideColor = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, 0);

    canvas.drawPath(insideColor, paintInside);
    canvas.drawPath(borderLine, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
