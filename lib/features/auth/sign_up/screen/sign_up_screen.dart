import 'package:at_clinic/features/auth/forgot_password/screens/otp_screen.dart';
import 'package:at_clinic/features/auth/login/screen/login_screen.dart';
import 'package:at_clinic/features/profile/edit_profile_screen.dart';
import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/gen/colors.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:at_clinic/shared/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/constants/font/size_config.dart';
import '../../../../shared/constants/string_constants.dart';
import '../../../../shared/text_widgets/build_text.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/signupScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Textediting controller
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //height and width
  double height = 0.0;
  double width = 0.0;

  //Country code
  final String countryCode = '+91';

  //bool
  bool isAgree = false;

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              appLogo(),
              titleSection(),
              SizedBox(height: height * 4),
              textFieldSection(),
              SizedBox(height: height * 1.5),
              agreeWidget(),
              SizedBox(height: height * 3),
              InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(VerificationScreen.routeName);
                  },
                  child: signupButton()),
              SizedBox(height: height * 3),
              alreadyHaveAccount(),
              SizedBox(height: height * 3),
            ],
          ),
        ),
      ),
    );
  }

//Title section
  Widget titleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: StringConstants.welcome,
          color: ColorName.colorPrimary,
          fontSize: 10.0.large25px(),
          family: FontFamily.poppinsSemiBold,
        ),
        BuildText(
          text: StringConstants.signupText,
          color: ColorName.colorPrimary,
          fontSize: 10.0.small12px(),
          family: FontFamily.poppinsRegular,
        ),
      ],
    );
  }

//Textfield Section
  Widget textFieldSection() {
    return Column(
      children: [
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          keyBoardType: TextInputType.name,
          controller: fullnameController,
          colorDecoration: ColorName.colorTextFormField,
          label: StringConstants.fullName,
          prefixIcon: Assets.icons.userIcon.image(),
        ),
        SizedBox(height: height * 1.5),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          keyBoardType: TextInputType.emailAddress,
          controller: emailController,
          colorDecoration: ColorName.colorTextFormField,
          label: StringConstants.emailAddress,
          prefixIcon: Assets.icons.emailIcon.image(),
        ),
        SizedBox(height: height * 1.5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            height: 40,
            decoration: const BoxDecoration(
                color: ColorName.colorTextFormField,
                borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  label: StringConstants.phone,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 1.5),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          obscureText: true,
          keyBoardType: TextInputType.text,
          controller: passwordController,
          colorDecoration: ColorName.colorTextFormField,
          label: StringConstants.password,
          prefixIcon: Assets.icons.passwordIcon.image(),
        ),
        SizedBox(height: height * 1.5),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          obscureText: true,
          keyBoardType: TextInputType.text,
          controller: confirmPasswordController,
          colorDecoration: ColorName.colorTextFormField,
          label: StringConstants.conPassword,
          prefixIcon: Assets.icons.passwordIcon.image(),
        )
      ],
    );
  }

//Agree Widget
  Widget agreeWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          isAgree = !isAgree;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: isAgree,
              onChanged: (value) {
                setState(() {
                  isAgree = !isAgree;
                });
              }),
          const SizedBox(
            width: 3,
          ),
          SizedBox(
            width: width * 65,
            child: BuildText(
              text: StringConstants.agreeText,
              family: FontFamily.poppinsRegular,
              fontSize: 10.0.small12px(),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

//Already Account
  Widget alreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildText(
          text: StringConstants.alreadyHaveAccount,
          color: ColorName.colorPrimary,
          family: FontFamily.poppinsRegular,
          fontSize: 10.0.small12px(),
        ),
        SizedBox(width: width * 2),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            LoginScreen.routeName,
          ),
          child: BuildText(
            text: StringConstants.login,
            color: ColorName.colorPrimary,
            family: FontFamily.poppinsSemiBold,
            fontSize: 10.0.small12px(),
          ),
        ),
      ],
    );
  }

//Signup button
  Widget signupButton() {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.signup,
      color: ColorName.colorLoginButton,
    );
  }

//Applogo
  Widget appLogo() {
    return Image(
      image: Assets.images.signupIllustration.image().image,
      height: height * 35,
      width: width * 70,
    );
  }
}
