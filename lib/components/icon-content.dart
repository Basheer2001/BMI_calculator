import 'package:flutter/material.dart';

import '../constants.dart';

class iconContent extends StatelessWidget {
  iconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIoneSize,
        ),
        SizedBox(height: kSizedBoxHeigh),
        Text(
          label,
          style: kLableTextStyle,
        )
      ],
    );
  }
}
