import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  IconData icon;
  Function function;
  RoundIconButton({required this.icon,required this.function});

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      onPressed: function as void Function(),
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints:  const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),



    );
  }
}