import 'package:at_clinic/features/auth/login/screen/login_screen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/constants/font/size_config.dart';
import '../../../../shared/text_widgets/build_text.dart';
import '../../../../shared/widget/app_button.dart';

class ChangePasswoedSuccessScreen extends StatefulWidget {
  static const String routeName = "/changePasswordSuccessScreen";
  const ChangePasswoedSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswoedSuccessScreen> createState() =>
      _ChangePasswoedSuccessScreenState();
}

class _ChangePasswoedSuccessScreenState extends State<ChangePasswoedSuccessScreen> {
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: createBody(),
      ),
    );
  }


  Widget createBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 10,
        vertical: height * 2,
      ),
      child: Column(
        children: [
          Center(child: imageWidget()),
          SizedBox(
            height: height * 5,
          ),
          BuildText(
            textAlign: TextAlign.center,
            color: Colors.black,
            text:"Password changed successfully",
            family: FontFamily.poppinsSemiBold,
            fontSize: 10.0.medium20px(),
          ),
          const Spacer(),
          loginButton(),
        ],
      ),
    );
  }


  Widget imageWidget() {
    return Assets.images.success.image(
      height: height * 50,
      width: width * 80,
    );
  }


  Widget loginButton() {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: 'Login',
      color: ColorName.colorLoginButton,
      onTap: () => Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false),
    );
  }
}