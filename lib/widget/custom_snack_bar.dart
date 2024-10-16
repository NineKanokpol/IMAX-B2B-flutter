import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnack {
  final String message;

  const CustomSnack({
    required this.message,
  });

  static show(
      BuildContext context,
      String message,
      ) async{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      elevation: 2.0,
      // width: MediaQuery.of(context).size.width*0.4,
      backgroundColor: Colors.orange,
      content: Text(
        message.tr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
        // bottom: (MediaQuery.of(context).size.height - 120) - MediaQuery.of(context).padding.top,
          bottom: 56,
          right: MediaQuery.of(context).size.width * 0.2,
          left: MediaQuery.of(context).size.width * 0.2),
    ));
  }
}