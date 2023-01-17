import 'package:at_clinic/features/auth/login/screen/login_screen.dart';
import 'package:at_clinic/features/splash/splash_screen.dart';
import 'package:at_clinic/routes/routes.dart';
import 'package:at_clinic/shared/constants/providers_constant.dart';
import 'package:at_clinic/shared/services/navigaation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget { 
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'At Clinic',
      routes: Routes.routes,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
