import 'package:flutter/material.dart';
import 'package:imaxb2bflutter/pages/home/home_page.dart';

class Navigation {
  static Navigation shared = Navigation();

  void toHomePage(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
