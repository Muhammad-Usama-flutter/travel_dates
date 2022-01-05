
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color txtColor = Color(0xFF24234E);
Color iconActiveClr = Color(0xFFAF9A73);
Color iconInActiveClr = Color(0xFFFFFFFF);
String userEmail = "";
bool isUpComing = false;
bool isPast = false;
bool isDeleteCheck = false;

void showMessage(String mess, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mess),
  ));
}