import 'dart:async';
import 'package:at_clinic/features/welcome/screen/welcome_screen_one.dart';
import 'package:at_clinic/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/font/size_config.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //height and width
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreenOne(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return SafeArea(
      child: Scaffold(
        body: createBody(),
      ),
    );
  }

//Create Body
  Widget createBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.backgroundImg.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image(
          image: Assets.images.applogo.image().image,
          height: height * 20,
          width: width * 40,
        ),
      ),
    );
  }
}
