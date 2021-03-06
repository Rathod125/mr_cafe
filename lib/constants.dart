import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF212325), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF212325), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kItemLableTextStyle = TextStyle(
  color: Color(0xFFEADBCC),
  fontSize: 35.0,
  fontFamily: 'Lobster',
);

const kNormalTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 20.0,
);

const kBackGroundColor = Color(0xFFEADBCC);
