import 'package:flutter/material.dart';

import '../home_bloc.dart';

class SwipeCard extends StatelessWidget {
  final double edgeSize;
  final CounterBloc counterBloc;

  const SwipeCard({
    Key key,
    @required this.edgeSize,
    @required this.counterBloc,
  }) : super(key: key);

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
        child: StreamBuilder<int>(
          initialData: counterBloc.counter,
          stream: counterBloc.$counter,
          builder: (_, counter) {
            if (counter.hasData) {
              return Center(
                child: Text(
                  counter.data.toString(),
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
