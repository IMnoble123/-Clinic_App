import 'package:at_clinic/features/auth/forgot_password/screens/forgot_password_screen.dart';
import 'package:at_clinic/features/auth/forgot_password/screens/otp_screen.dart';
import 'package:at_clinic/features/auth/forgot_password/screens/password_success_screen.dart';
import 'package:at_clinic/features/auth/forgot_password/screens/set_new_password_screen.dart';
import 'package:at_clinic/features/auth/login/screen/login_screen.dart';
import 'package:at_clinic/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:at_clinic/features/bottom_nav_bar/screen/bottom_nav_bar.dart';
import 'package:at_clinic/features/doctors_list/screen/doctors_list_screen.dart';
import 'package:at_clinic/features/home/screen/case_screen.dart';
import 'package:at_clinic/features/home/screen/home_page.dart';
import 'package:at_clinic/features/profile/edit_profile_screen.dart';
import 'package:at_clinic/features/profile/profile_screen.dart';
import 'package:at_clinic/features/welcome/screen/welcome_screen_one.dart';
import 'package:at_clinic/features/welcome/screen/welcome_screen_three.dart';
import 'package:at_clinic/features/welcome/screen/welcome_screen_two.dart';

class Routes {
  static var routes = {
    LoginScreen.routeName: (ctx) => const LoginScreen(),
    SignUpScreen.routeName: (ctx) => const SignUpScreen(),
    WelcomeScreenOne.routeName: (ctx) => const WelcomeScreenOne(),
    WelcomeScreenTwo.routeName: (ctx) => const WelcomeScreenTwo(),
    WelcomeScreenThree.routeName: (ctx) => const WelcomeScreenThree(),
    DoctorsScreen.routeName:(ctx)=> const DoctorsScreen(),
    HomeScreen.routeName:(ctx)=> const HomeScreen(),
    VerificationScreen.routeName:(ctx)=> const VerificationScreen(),
    ForgotPasswordScreen.routeName:(ctx) => const ForgotPasswordScreen(),
    SetPasswordScreen.routeName:(ctx)=> const SetPasswordScreen(),
    ChangePasswoedSuccessScreen.routeName:(ctx)=> const ChangePasswoedSuccessScreen(),
    ProfileScreen.routeName:(ctx)=> const ProfileScreen(),
    EditProfileScreen.routeName:(ctx)=> const EditProfileScreen(),
    BottomNavBarScreen.routeName:(ctx)=> const BottomNavBarScreen(),
    CasesScreen.routeName:(ctx)=> const CasesScreen()

  };
}