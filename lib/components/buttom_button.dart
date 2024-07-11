import 'package:flutter/material.dart';

import '../constants.dart';
class BottumBotton extends StatelessWidget {
  BottumBotton({required this.buttonTitle,required this.onTap});
  final  Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
        child: Center(
          child: Text(buttonTitle,style: kLargeButtonTextStyle,),
        ),
        color: kButtomContainerColor,
        width: double.infinity,
        height: kButtomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
      ),
    );
  }
}
