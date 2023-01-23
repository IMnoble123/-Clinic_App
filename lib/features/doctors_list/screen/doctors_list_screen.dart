import 'package:at_clinic/gen/assets.gen.dart';
import 'package:at_clinic/gen/colors.gen.dart';
import 'package:at_clinic/shared/constants/font/font_constants.dart';
import 'package:at_clinic/shared/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../gen/fonts.gen.dart';
import '../../../shared/text_widgets/build_text.dart';
import '../../../shared/widget/filter_bar.dart';

class DoctorsScreen extends StatefulWidget {
  static const String routeName = "/doctorsScreen";
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   leading: appBarButton(context),
          //   title: const Text(StringConstants.doctor),
          //   actions: [
          //     IconButton(
          //         onPressed: () => showLogoutDialog(context),
          //         icon: const Icon(
          //           Icons.logout,
          //           color: Colors.black,
          //         ))
          //   ],
          // ),
          body: createBody()),
    );
  }

  Widget createBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Assets.images.backgroundImg.image().image,
            fit: BoxFit.cover),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              searchBar(),
              const SizedBox(height: 10),
              FilterBar(
                items: const ['All', 'Dentist', 'Cardiology', 'Physio Therapy'],
                onItemSelected: (index) {},
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i_qZtrjSgoPCyIOywhlX8MKOzRIaQbKU0A&usqp=CAU',
                              height: 90,
                              width: 90,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      BuildText(
                                        color: Colors.black,
                                        text: "Dr. Sijo Simon",
                                        family: FontFamily.poppinsSemiBold,
                                        fontSize: 10.0.small14px(),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  BuildText(
                                        color: Colors.black,
                                        text: "Specialist Cardiologist",
                                        family: FontFamily.poppinsRegular,
                                        fontSize: 10.0.small10px(),
                                      ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: 4.5,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 15,
                                        direction: Axis.horizontal,
                                      ),
                                      const Spacer(),
                                       BuildText(
                                        color: Colors.black,
                                        text: "4.5",
                                        family: FontFamily.poppinsSemiBold,
                                        fontSize: 10.0.small14px(),
                                      ),
                                      BuildText(
                                        color: Colors.black,
                                        text: "(150 reviews)",
                                        family: FontFamily.poppinsRegular,
                                        fontSize: 10.0.small12px(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                ),
              )
            ],
          )),
    );
  }

  showLogoutDialog(context) {
    const textStyle = TextStyle(color: ColorName.colorLoginButton);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: textStyle,
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: textStyle,
                ))
          ],
        );
      },
    );
  }

  Widget searchBar() {
    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          const Expanded(
              child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Search',
            ),
          )),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget appBarButton(BuildContext context) {
    return const Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
    );
  }
}
