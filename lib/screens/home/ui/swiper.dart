import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_bloc.dart';
import 'swipe_card.dart';

class Swiper extends StatefulWidget {
  final BoxConstraints constraints;
  final double maxEdgeSize;

  Swiper({Key key, @required this.constraints})
      : maxEdgeSize = constraints.maxWidth * 0.6;

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));

    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return Draggable(
      axis: Axis.horizontal,
      child: ScaleTransition(
        scale: _animation,
        child: SwipeCard(
          edgeSize: widget.maxEdgeSize,
          counterBloc: counterBloc,
        ),
      ),
      onDragEnd: (details) {
        if (details.offset.dx > widget.constraints.maxWidth * 0.9) {
          counterBloc.increase();
          _controller
            ..reset()
            ..forward();
        } else if (details.offset.dx < -widget.constraints.maxWidth * 0.5) {
          counterBloc.decrease();
          _controller
            ..reset()
            ..forward();
        }
      },
      feedback: SwipeCard(
        edgeSize: widget.maxEdgeSize,
        counterBloc: counterBloc,
      ),
      childWhenDragging: Container(),
    );
  }
}
