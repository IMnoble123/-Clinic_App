import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/constants/string_constants.dart';
import '../../shared/text_widgets/build_text.dart';
import '../../shared/widget/app_button.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "/EditProfileScreen";
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  double height = 0.0;
  double width = 0.0;

    final String countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return Scaffold(
      backgroundColor: ColorName.colorWhite,
        appBar: AppBar(
          leading: appBarButton(context),
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorName.colorLoginButton,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: createBody(context));
  }

  Widget createBody(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
                color: ColorName.colorLoginButton,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Setup your profile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Update Your profile to connect your doctor with \n better impresssion',
                  textAlign: TextAlign.center,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'),
                      radius: 60,
                    ),
                    Positioned(
                      bottom: 0,
                      right: -10,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 12,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(8)),
                        child: const Icon(Icons.camera_alt),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: height * 7 ),
        textFieldSection()
      ],
    );
  }

 Widget textFieldSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BuildLoginTextFieldBorder(
            textWidth: width,
            maxLines: 1,
            containerWidth: width * 80,
            keyBoardType: TextInputType.name,
            controller: namecontroller,
            colorDecoration: ColorName.colorTextFormField,
            label: StringConstants.fullName,
            prefixIcon: Assets.icons.userIcon.image(),
          ),
          SizedBox(height: height * 3),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 40,
              decoration: const BoxDecoration(
                  color: ColorName.colorTextFormField,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icons.phoneIcon.image(),
                  SizedBox(width: width * 3),
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
          SizedBox(height: height * 3),
          BuildLoginTextFieldBorder(
            textWidth: width,
            maxLines: 1,
            containerWidth: width * 80,
            obscureText: true,
            keyBoardType: TextInputType.text,
            controller: dateOfBirthController,
            colorDecoration: ColorName.colorTextFormField,
            label: StringConstants.password,
            prefixIcon: Assets.icons.passwordIcon.image(),
          ),
          SizedBox(height: height * 5),
          continueButton(),

        ],
      ),
    );
  }


  Widget continueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppButton(
        buttonWidth: MediaQuery.of(context).size.width,
        title: StringConstants.save,
        color: ColorName.colorLoginButton,
      ),
    );
  }

  Widget appBarButton(BuildContext context) {
    return Center(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.black,
            )),
      ),
    );
  }
}
