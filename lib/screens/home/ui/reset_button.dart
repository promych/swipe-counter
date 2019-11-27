import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../theme.dart';

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
