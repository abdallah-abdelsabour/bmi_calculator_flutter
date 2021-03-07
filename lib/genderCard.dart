import 'package:flutter/material.dart';


class GenderCard extends StatelessWidget {
  final Icon genderIcon;

  final String kindName;
  final textStyle ;

  GenderCard({this.genderIcon,
  this.kindName,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderIcon,
        SizedBox(
          height: 25,
        ),
        Text(kindName,style: textStyle,)
      ],
    );
  }
}