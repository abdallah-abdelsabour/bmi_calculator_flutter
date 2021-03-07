
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, femal }

Color activeColor = Color(0xff1D1E33);
Color notActiveColor = Color(0xff111328);

const lableTextStyle = TextStyle(fontSize: 18, color: Color(0xff8D8E98));

const numberStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 50);

Icon maleIcon = Icon(
  FontAwesomeIcons.mars,
  color: Colors.white,
  size: 80,
);

Icon femalIcon = Icon(
  FontAwesomeIcons.venus,
  color: Colors.white,
  size: 80,
);