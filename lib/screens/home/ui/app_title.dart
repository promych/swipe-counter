import 'package:flutter/material.dart';

import '../../../constants.dart';

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
