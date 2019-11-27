import 'package:flutter/material.dart';

class Swiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final initSize = constrains.maxWidth * 0.6;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 4.0,
          child: Container(
            height: initSize,
            width: initSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        );
      },
    );
  }
}
