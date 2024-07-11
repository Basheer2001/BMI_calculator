
import 'package:flutter/material.dart';
class Reusablecontainer extends StatelessWidget {
  Reusablecontainer({@required this.colour, required this.cardChild, required this.onPressed});

  final colour;
  final Widget cardChild;
  Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function(),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}