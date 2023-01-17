import 'package:at_clinic/features/doctors_list/screen/doctors_list_screen.dart';
import 'package:at_clinic/features/profile/edit_profile_screen.dart';
import 'package:at_clinic/features/profile/profile_screen.dart';
import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/gen/colors.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../shared/constants/font/size_config.dart';
import '../../../shared/text_widgets/build_text.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0.0;
  double width = 0.0;

  // @override
  // void initState() {
  //   height = SizeConfig.safeBlockVertical!;
  //   width = SizeConfig.safeBlockHorizontal!;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: createBody(context),
    ));
  }

  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: ColorName.colorLoginButton,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            color: Colors.white,
                            text: "Hi Handerker!",
                            family: FontFamily.poppinsRegular,
                            fontSize: 10.0.small13px(),
                          ),
                          BuildText(
                            color: Colors.white,
                            text: "Find Your Doctor",
                            family: FontFamily.poppinsSemiBold,
                            fontSize: 10.0.large22px(),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      )
                    ],
                  ),
                ),
              ),
              liveDoctorsText(),
              liveDoctorsWidget(),
              popularDoctorText(),
              popularDoctorWidget(),
              featuredDoctorsText(),
              featuredDoctorWidget(),
            ],
          ),
          searchBar()
        ],
      ),
    );
  }

  Widget liveDoctorsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.maxFinite,
        height: 200,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: SizedBox(
                  width: 150,
                  child: Stack(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9jdG9yc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      const ColoredBox(
                          color: Colors.black26,
                          child: SizedBox(
                              height: double.maxFinite,
                              width: double.maxFinite)),
                      const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.play_circle,
                              color: Colors.white, size: 50)),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          color: Colors.red,
                          height: 20,
                          width: 60,
                          margin: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                  backgroundColor: Colors.white, radius: 5),
                              BuildText(
                                color: Colors.white,
                                text: "Live",
                                family: FontFamily.poppinsRegular,
                                fontSize: 10.0.small13px(),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget liveDoctorsText() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
      child: BuildText(
        color: Colors.black,
        text: "Live Doctors",
        family: FontFamily.poppinsSemiBold,
        fontSize: 10.0.large22px(),
      ),
    );
  }

  Widget searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 140, horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          fillColor: ColorName.colorTextFormField,
          filled: true,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.clear),
          hintText: 'Search...',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget featuredDoctorsText() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
           BuildText(
        color: Colors.black,
        text: "Feature Doctors",
        family: FontFamily.poppinsSemiBold,
        fontSize: 10.0.large22px(),
      ),
           BuildText(
            color: Colors.black,
            text: "see all",
            family: FontFamily.poppinsRegular,
            fontSize: 10.0.small13px(),
          ),
        ],
      ),
    );
  }

  Widget featuredDoctorWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.maxFinite,
        height: 150,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Expanded(
                          child: Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdyZ0jEAqCUBMJHbx7Y3bnjlAAG1_07mbqtWvJhRN3Ug&s'),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            BuildText(
                              color: Colors.black,
                              text: "Dr.Crick",
                              family: FontFamily.poppinsSemiBold,
                              fontSize: 10.0.small14px(),
                            ),
                            BuildText(
                              color: Colors.black,
                              text: "\$ 25.00/hr",
                              family: FontFamily.poppinsRegular,
                              fontSize: 10.0.small10px(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: const [
                        Icon(Icons.favorite_outline_outlined,
                            color: Colors.black45, size: 20),
                        SizedBox(width: 40),
                        Text('3.7',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget popularDoctorText() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildText(
            color: Colors.black,
            text: "Popular Doctors",
            family: FontFamily.poppinsSemiBold,
            fontSize: 10.0.large22px(),
          ),
          BuildText(
            color: Colors.black,
            text: "view all",
            family: FontFamily.poppinsRegular,
            fontSize: 10.0.small13px(),
          ),
        ],
      ),
    );
  }

  Widget popularDoctorWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.maxFinite,
        height: 250,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DoctorsScreen.routeName);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          BuildText(
                            color: Colors.black,
                            text: "Dr.Fillerup Grab",
                            family: FontFamily.poppinsSemiBold,
                            fontSize: 10.0.large22px(),
                          ),
                          BuildText(
                            color: Colors.black,
                            text: "Medicine specialist",
                            family: FontFamily.poppinsLight,
                            fontSize: 10.0.small13px(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
