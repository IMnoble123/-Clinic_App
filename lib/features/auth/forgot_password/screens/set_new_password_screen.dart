import 'package:at_clinic/features/auth/forgot_password/screens/password_success_screen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/constants/font/size_config.dart';
import '../../../../shared/text_widgets/build_text.dart';
import '../../../../shared/widget/app_button.dart';

class SetPasswordScreen extends StatefulWidget {
  static const String routeName = "/setNewPasswordScreen";
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  double height = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          createBody(),
          changeWidet(),
        ],
      ),
    ));
  }

  Widget createBody() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 10),
            Center(
              child: imageLogo(),
            ),
            SizedBox(height: height * 7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 10),
              child: setNewPasswordWidget(),
            ),
            SizedBox(
              height: height * 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageLogo() {
    return Assets.images.passwod.image(
      height: height * 30,
      width: width * 80,
    );
  }

  Widget setNewPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          color: Colors.black,
          text: "Set new password",
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.large24px(),
        ),
        SizedBox(
          height: height * 1,
        ),
        BuildText(
          text:
              "our new password must be different from previosly used passwords.",
          family: FontFamily.poppinsRegular,
          fontSize: 10.0.small13px(),
          color: Colors.black,
        ),
        SizedBox(
          height: height * 4,
        ),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          obscureText: true,
          keyBoardType: TextInputType.text,
          controller: passwordController,
          colorDecoration: ColorName.colorTextFormField,
          label: "Password",
          prefixIcon: Assets.icons.passwordIcon.image(),
        ),
        SizedBox(
          height: height * 2,
        ),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 1,
          containerWidth: width * 80,
          obscureText: true,
          keyBoardType: TextInputType.text,
          controller: conPasswordController,
          colorDecoration: ColorName.colorTextFormField,
          label: "Conirm Password",
          prefixIcon: Assets.icons.passwordIcon.image(),
        )
      ],
    );
  }

  Widget changeWidet() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 10),
        child: AppButton(
          buttonWidth: MediaQuery.of(context).size.width,
          title: 'Change Password',
          color: ColorName.colorLoginButton,
          onTap: () {
            Navigator.of(context)
                .pushNamed(ChangePasswoedSuccessScreen.routeName);
          },
        ),
      ),
    );
  }
}
