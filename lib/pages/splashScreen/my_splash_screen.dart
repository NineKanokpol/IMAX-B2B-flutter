import 'dart:async';

import 'package:flutter/material.dart';

import '../../navigation.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.height,
          child: Image.asset(
            '',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  checkLogin() {
    Timer(const Duration(seconds: 1), () {
      Navigation.shared.toHomePage(context);
    });
  }
}
