import 'package:flutter/material.dart';

import 'ui/app_title.dart';
import 'ui/reset_button.dart';
import 'ui/swipe_area.dart';

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
