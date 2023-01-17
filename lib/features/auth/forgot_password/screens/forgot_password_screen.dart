import 'package:at_clinic/features/auth/forgot_password/screens/set_new_password_screen.dart';
import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/constants/font/size_config.dart';
import '../../../../shared/text_widgets/build_text.dart';
import '../../../../shared/widget/app_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/forgotPasswordMobileScreen";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneController = TextEditingController();
  double height = 0.0;
  double width = 0.0;
  String countryCode = "+91";

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorName.colorWhite,
      body: Stack(
        children: [createBody()],
      ),
    ));
  }

  Widget createBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: height * 5,
          ),
          imageLogo(),
          SizedBox(
            height: height * 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 10),
            child: fieldWidget(),
          ),
          SizedBox(
            height: height * 15,
          ),
          nextButton(),
          SizedBox(
            height: height * 20,
          )
        ],
      ),
    );
  }

  Widget imageLogo() {
    return SizedBox(
      height: height * 30,
      child: Center(
        child: Assets.images.forgotPassword.image(),
      ),
    );
  }

  Widget nextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 10),
      child: AppButton(
        buttonWidth: width * 80,
        title: 'Next',
        color: ColorName.colorLoginButton,
        onTap: () {
          Navigator.of(context).pushNamed(SetPasswordScreen.routeName);
        },
      ),
    );
  }

  Widget fieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: "Password recovery",
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.large24px(),
          color: Colors.black,
        ),
        SizedBox(height: height * 0.8),
        BuildText(
          text: "Please enter your Mobile number to receive verification code",
          family: FontFamily.poppinsRegular,
          fontSize: 10.0.small12px(),
          color: Colors.black,
        ),
        SizedBox(height: height * 3),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: const BoxDecoration(
              color: ColorName.colorTextFormField,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.icons.phoneIcon.image(),
              SizedBox(width: width * 1.5),
              BuildText(
                text: countryCode,
                family: FontFamily.poppinsRegular,
                fontSize: 10.0.small12px(),
                color: Colors.black,
              ),
              SizedBox(width: width * 1.5),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: VerticalDivider(
                  color: ColorName.colorTextFormFieldText,
                  thickness: 0.5,
                ),
              ),
              const Spacer(),
              BuildTextFieldNoBorder(
                textWidth: width,
                maxLines: 1,
                containerWidth: width * 55,
                keyBoardType: TextInputType.phone,
                textInputFormatter: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: phoneController,
                colorDecoration: ColorName.colorTextFormField,
                label: "Phone Number",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
