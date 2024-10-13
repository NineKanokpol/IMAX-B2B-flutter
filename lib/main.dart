import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:imaxb2bflutter/pages/splashScreen/my_splash_screen.dart';

import 'appManager/locale_string.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IMAX B2B',
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Locale('th', 'TH'),
      home: MySplashScreen(),
      navigatorKey: GlobalVariable.navState,
      theme: ThemeData(
        fontFamily: "Prompt",
        // primaryColor: ColorManager().primaryColor,
        useMaterial3: false,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: Colors.white),
      ),
    );
  }
}

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
