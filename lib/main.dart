import 'package:flutter/material.dart';

import 'screens/home/home.dart';
import 'theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
      ),
      home: HomePage(),
    );
  }
}
