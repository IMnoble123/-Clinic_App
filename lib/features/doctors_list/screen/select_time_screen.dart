
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:at_clinic/shared/constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../shared/constants/font/size_config.dart';
import '../../../shared/text_widgets/build_text.dart';

class SelectTimeScreen extends StatefulWidget {
  static const String routeName = "/selectTimeScreen";
  const SelectTimeScreen({Key? key}) : super(key: key);

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  //height and width
  double height = 0.0;
  double width = 0.0;

  //bool
  bool isFav = false;

  void isFaveFunction() {
    setState(() {
      isFav = !isFav;
    });
  }

  int selectedIndex = 0;

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
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

//Create body
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
        padding: EdgeInsets.symmetric(horizontal: width * 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 2),
            appbarWidget(),
            SizedBox(height: height * 3),
            doctorCard(),
            SizedBox(height: height * 4),
            listviewWidget(),
            SizedBox(height: height * 3),
            nextSection(),
            SizedBox(height: height * 3),
            afterNoonSlotWidget(),
          ],
        ),
      ),
    );
  }

//Appbar widget
  Widget appbarWidget() {
    return Row(
      children: [
        Container(
          height: height * 4,
          width: width * 8,
          decoration: BoxDecoration(
            color: ColorName.colorWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        SizedBox(width: width * 3),
        BuildText(
          text: StringConstants.selectTime,
          color: ColorName.colorPrimary,
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.medium15px(),
        ),
      ],
    );
  }

//Doctor Card
  Widget doctorCard() {
    return Card(
      color: ColorName.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: height * 10,
              width: width * 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Assets.images.doctor.image().image,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BuildText(
                        text: 'Dr. Shruthi Kedia',
                        color: ColorName.colorPrimary,
                        family: FontFamily.poppinsSemiBold,
                        fontSize: 10.0.medium15px(),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFaveFunction();
                          });
                        },
                        child: Center(
                          child: isFav == false
                              ? const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                        ),
                      )
                    ],
                  ),
                  BuildText(
                    text: 'Uspetta Dental clinic, salt lake',
                    color: ColorName.colorPrimary,
                    family: FontFamily.poppinsLight,
                    fontSize: 10.0.small12px(),
                  ),
                  SizedBox(height: height * 1),
                  Row(
                    children: [
                      starIcons0(Colors.amber),
                      starIcons0(Colors.amber),
                      starIcons0(Colors.amber),
                      starIcons0(Colors.amber),
                      starIcons0(Colors.grey),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//star icons
  Widget starIcons0(Color color) {
    return Icon(
      Icons.star,
      color: color,
      size: 15,
    );
  }

//listview widget
  Widget listviewWidget() {
    List<String> dateTitle = [
      'Today 23, Feb',
      'Tomorrow 24, Feb',
      'Wenesday 25, Feb',
      'Thursday 26, Feb',
    ];

    List<String> slotText = [
      'No Slots available',
      '7 Slots available',
      '6 Slots available',
      '3 Slots available',
    ];

    return SizedBox(
      height: height * 7,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: width * 3),
        itemCount: dateTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              updateIndex(index);
            },
            child: selectedIndex == index
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 4),
                    decoration: BoxDecoration(
                        color: ColorName.colorLoginButton,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            text: dateTitle[index],
                            color: ColorName.colorWhite,
                            family: FontFamily.poppinsSemiBold,
                            fontSize: 10.0.medium15px(),
                          ),
                          BuildText(
                            text: slotText[index],
                            color: ColorName.colorWhite,
                            family: FontFamily.poppinsRegular,
                            fontSize: 10.0.small12px(),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 4),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorName.colorLoginButton, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            text: dateTitle[index],
                            color: ColorName.colorPrimary,
                            family: FontFamily.poppinsSemiBold,
                            fontSize: 10.0.medium15px(),
                          ),
                          BuildText(
                            text: slotText[index],
                            color: ColorName.colorPrimary,
                            family: FontFamily.poppinsRegular,
                            fontSize: 10.0.small12px(),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

//nextSection
  Widget nextSection() {
    return Center(
      child: BuildText(
        text: 'Today 23, Feb',
        color: ColorName.colorPrimary,
        family: FontFamily.poppinsSemiBold,
        fontSize: 10.0.medium15px(),
      ),
    );
  }

//afternoon slot widget
  Widget afterNoonSlotWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: 'Afternoon 7 Slots',
          color: ColorName.colorPrimary,
          family: FontFamily.poppinsSemiBold,
          fontSize: 10.0.medium15px(),
        ),
        SizedBox(height: height * 1),
        
      ],
    );
  }
}
