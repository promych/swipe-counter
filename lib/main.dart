import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home/home.dart';
import 'theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        textTheme: TextTheme().copyWith(
          title: TextStyle(fontSize: 32.0),
          button: TextStyle(fontSize: 24.0),
        ),
      ),
      home: HomePage(),
    );
  }
}
