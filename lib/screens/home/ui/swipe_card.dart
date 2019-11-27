import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final double edgeSize;

  const SwipeCard({Key key, @required this.edgeSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      elevation: 4.0,
      child: Container(
        height: edgeSize,
        width: edgeSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
  }
}
