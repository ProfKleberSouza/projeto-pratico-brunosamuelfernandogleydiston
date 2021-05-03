import 'package:doar_app/design/palette.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(cyanThemeColor),
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
