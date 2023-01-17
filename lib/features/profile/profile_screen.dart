// ignore_for_file: prefer_const_constructors

import 'package:at_clinic/features/profile/edit_profile_screen.dart';
import 'package:at_clinic/gen/colors.gen.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/font/size_config.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/profileScreen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  
  double height = 0.0;
  double width = 0.0;

@override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
        body: createBody());
  }

  Widget createBody() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(EditProfileScreen.routeName);
          },
          child: profileWidget(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVrC1ZsObLq8PcMS_OyVIP3iFVWhrxzXA80A&usqp=CAU',
            'Sushima Sircat',
            'sushmitha@gmail.com',
          ),
        ),
        const SizedBox(height: 10),
        profileItemGroup('Informations', [
          ProfileItem(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () {},
          ),
          ProfileItem(icon: Icons.lock, title: 'Password', onTap: () {}),
          ProfileItem(
              icon: Icons.calendar_month,
              title: 'Calender Settings',
              onTap: () {})
        ]),
        profileItemGroup('Preferences', [
          ProfileItem(icon: Icons.language, title: 'Language', onTap: () {}),
          ProfileItem(icon: Icons.settings, title: 'Theme', onTap: () {}),
        ]),
        profileItemGroup('Account', [
          ProfileItem(icon: Icons.add, title: 'Add Account', onTap: () {}),
          ProfileItem(
              icon: Icons.switch_account,
              title: 'Switch Account',
              onTap: () {}),
          ProfileItem(icon: Icons.logout, title: 'Log Out', onTap: () {}),
        ])
      ],
    );
  }

  Widget profileWidget(String image, String name, String mail) {
    return Container(
      decoration: BoxDecoration(
          color: ColorName.colorLoginButton,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  mail,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(ProfileItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              item.icon,
              color: ColorName.colorLoginButton,
            ),
            const SizedBox(width: 10),
            Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget profileItemGroup(String title, List<ProfileItem> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: ColorName.colorLoginButton,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: items.map((item) => _buildItem(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileItem {
  ProfileItem({required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
}
