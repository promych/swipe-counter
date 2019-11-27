import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppTitle(),
            ),
            Expanded(
              flex: 2,
              child: SwipeArea(),
            ),
            Expanded(
              flex: 1,
              child: ResetButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        kAppTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Center(
          child: SizedBox(
            width: constrains.maxWidth / 2.5,
            height: 50.0,
            child: FlatButton(
              child: Text(
                kResetButtonLabel,
                style: Theme.of(context).textTheme.button,
              ),
              color: Styles.resetButtonColor,
              shape: StadiumBorder(),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}

class SwipeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SwipeDirectionMarker(label: '-'),
            _SwipeDirectionMarker(label: '+'),
          ],
        ),
        Swiper(),
      ],
    );
  }
}

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
