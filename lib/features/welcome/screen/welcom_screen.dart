// import 'package:e_commerce_app/src/controller/welcome_screen_controller/welcome_screen_controller.dart';
// import 'package:e_commerce_app/src/view/authentication_view/login_view/login_view.dart';
// import 'package:e_commerce_app/src/view/welcome_screens/welcome_screen_one.dart';
// import 'package:e_commerce_app/src/view/welcome_screens/welcome_screen_three.dart';
// import 'package:e_commerce_app/src/view/welcome_screens/welcome_screen_two.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             onPageChanged: ((index) {
//               Provider.of<WelcomeScreenController>(context, listen: false)
//                   .boolianUpdate(index);
//             }),
//             controller:
//                 Provider.of<WelcomeScreenController>(context).controller,
//             children: const [
//               WelcomScreenOne(),
//               WelcomeScreenTwo(),
//               WelcomeScreenThree(),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20.w),
//             width: MediaQuery.of(context).size.width,
//             alignment: const Alignment(0, 0.9),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmoothPageIndicator(
//                   effect: ExpandingDotsEffect(
//                     spacing: 10,
//                     radius: 5,
//                     dotWidth: 20,
//                     dotHeight: 12,
//                     dotColor: HexColor('#ABAEB1'),
//                     activeDotColor: HexColor('#19080C'),
//                   ),
//                   controller: Provider.of<WelcomeScreenController>(context,
//                           listen: false)
//                       .controller,
//                   count: 3,
//                 ),
//                 Provider.of<WelcomeScreenController>(context).onLastPage
//                     ? GestureDetector(
//                         onTap: () => Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: (context) => const LoginView()),
//                           (route) => false,
//                         ),
//                         child: Container(
//                           height: 30.h,
//                           width: 130.w,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(5.r),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'GET START',
//                               style: GoogleFonts.rubik(
//                                 color: Colors.white,
//                                 fontSize: 12.sp,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: () {
//                           Provider.of<WelcomeScreenController>(context,
//                                   listen: false)
//                               .controller
//                               .nextPage(
//                                 duration: const Duration(
//                                   milliseconds: 500,
//                                 ),
//                                 curve: Curves.easeIn,
//                               );
//                         },
//                         child: Container(
//                           height: 30.h,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
