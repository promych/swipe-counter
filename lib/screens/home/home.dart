import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_bloc.dart';
import 'ui/app_title.dart';
import 'ui/reset_button.dart';
import 'ui/swipe_area.dart';

class HomePage extends StatefulWidget {
  final CounterBloc bloc;

  const HomePage({Key key, @required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    return Provider<CounterBloc>(
      create: (_) => HomeBloc()..load(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<CounterBloc>(
        builder: (context, bloc, _) => HomePage(bloc: bloc),
      ),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
