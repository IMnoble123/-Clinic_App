import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../shared/constants/font/size_config.dart';
import '../../../shared/constants/string_constants.dart';
import '../../../shared/text_widgets/build_text.dart';
import '../../../shared/widget/app_button.dart';
import '../../auth/login/screen/login_screen.dart';

class WelcomeScreenThree extends StatefulWidget {
  static const String routeName = "/welcomeScreenThree";
  const WelcomeScreenThree({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenThree> createState() => _WelcomeScreenThreeState();
}

class _WelcomeScreenThreeState extends State<WelcomeScreenThree> {
  //height and width
  double height = 0.0;
  double width = 0.0;

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
          image: Assets.images.circleBackground.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 10),
        child: Column(
          children: [
            SizedBox(height: height * 10),
            imageWidget(),
            SizedBox(height: height * 10),
            titleSection(),
            SizedBox(height: height * 5),
            getStartedButton(),
            SizedBox(height: height * 2),
            skipText(),
          ],
        ),
      ),
    );
  }

//Image Widget
  Widget imageWidget() {
    return Container(
      height: height * 40,
      width: width * 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.welcomeScreenThree.image().image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

//Title section
  Widget titleSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildText(
          text: StringConstants.welcomeScreenThreeTitle,
          color: ColorName.colorPrimary,
          fontSize: 10.0.large25px(),
          family: FontFamily.poppinsSemiBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 1),
        BuildText(
          text: StringConstants.welcomeOneSubtitle,
          color: ColorName.colorPrimary,
          fontSize: 10.0.small13px(),
          family: FontFamily.poppinsRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


//Get started
  Widget getStartedButton() {
    return AppButton(
      onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.routeName, (route) => false),
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.getStarted,
      color: ColorName.colorLoginButton,
    );
  }

//Skip text
  Widget skipText() {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false),
      child: BuildText(
        text: StringConstants.skip,
        color: ColorName.colorPrimary,
        fontSize: 10.0.medium16px(),
        family: FontFamily.poppinsmedium,
      ),
    );
  }
}
