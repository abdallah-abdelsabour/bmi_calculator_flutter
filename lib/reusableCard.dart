import 'package:flutter/material.dart';


class ResusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onpress;

  ResusableCard({@required this.cardColor, this.cardChild,  this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onpress,
         
        child: cardChild),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}