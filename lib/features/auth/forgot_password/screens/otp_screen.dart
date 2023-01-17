import 'package:at_clinic/features/auth/login/screen/login_screen.dart';
import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/gen/fonts.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:at_clinic/shared/text_widgets/build_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../shared/constants/font/size_config.dart';
import '../../../../shared/widget/app_button.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = "/otpScreen";
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();

  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Material(
        child: Stack(
          children: [
            createBody(),
          ],
        ),
      ),
    ));
  }

  Widget createBody() {
    return Column(
      children: [
        SizedBox(height: height * 10),
        Center(
          child: imageLogo(),
        ),
        SizedBox(height: height * 7),
        BuildText(
          color: Colors.black,
          text: "Verification code",
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.large24px(),
        ),
        SizedBox(height: height * 1),
        BuildText(
          color: Colors.black,
          text: "We have sent the code verification to ..",
          family: FontFamily.poppinsRegular,
          fontSize: 10.0.small13px(),
        ),
        SizedBox(
          height: height * 0.5,
        ),
        BuildText(
          text: '+91${0123456789}',
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.small13px(),
          color: Colors.black,
        ),
        SizedBox(
          height: height * 3,
        ),
        otpField(),
        SizedBox(
          height: height * 1,
        ),
        resendOtpWidet(),
        SizedBox(
          height: height * 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 10),
          child: AppButton(
            onTap: () {
              sucessWidget();
            },
            buttonWidth: MediaQuery.of(context).size.width,
            title: 'Confirm',
            color: ColorName.colorLoginButton,
          ),
        ),
      ],
    );
  }

  Widget resendOtpWidet() {
    return Center(
      child: BuildText(
        text: "resend",
        color: Colors.black,
        family: FontFamily.poppinsSemiBold,
        fontSize: 10.0.small14px(),
      ),
    );
  }

  Widget imageLogo() {
    return Assets.images.otpImage.image(height: height * 30, width: width * 80);
  }

  Widget otpField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 10),
      child: PinCodeTextField(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        autoDisposeControllers: false,
        appContext: context,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            selectedFillColor: ColorName.colorLoginButton,
            inactiveFillColor: Colors.white,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: height * 7,
            activeColor: Colors.transparent,
            fieldWidth: width * 13,
            selectedColor: Colors.transparent,
            activeFillColor: ColorName.colorTextFormField),
        animationDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        controller: otpController,
        onCompleted: (value) {},
        onChanged: (value) {},
      ),
    );
  }

  sucessWidget() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(40),
            topEnd: Radius.circular(40),
          ),
        ),
        context: context,
        builder: ((context) {
          return SizedBox(
            height: height * 200,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                      height: height * 50,
                      width: width * 50,
                      child: Assets.images.success.image()),
                ),
                BuildText(
                  color: Colors.black,
                  text: "Whooho",
                  family: FontFamily.poppinsSemiBold,
                  fontSize: 10.0.large24px(),
                ),
                SizedBox(height: height * 1.5),
                BuildText(
                  color: Colors.black,
                  text: "your phone has been verified succesfully",
                  family: FontFamily.poppinsSemiBold,
                  fontSize: 10.0.small12px(),
                ),
                SizedBox(height: height * 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 10),
                  child: AppButton(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName, (route) => false);
                    },
                    buttonWidth: MediaQuery.of(context).size.width,
                    title: "Get Started",
                    color: ColorName.colorLoginButton,
                  ),
                ),
                SizedBox(height: height * 2),
              ],
            ),
          );
        }));
  }
}
