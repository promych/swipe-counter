import 'package:flutter/material.dart';

import 'swiper.dart';

class SwipeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _SwipeDirectionMarker(label: '-'),
            const _SwipeDirectionMarker(label: '+'),
          ],
        ),
        Swiper(),
      ],
    );
  }
}

class _SwipeDirectionMarker extends StatelessWidget {
  final String label;

  const _SwipeDirectionMarker({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40.0,
        width: 40.0,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        color: Colors.white.withAlpha(50),
      ),
    );
  }
}
