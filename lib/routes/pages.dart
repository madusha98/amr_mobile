import 'package:amr_mobile/bindings/auth/createNewPasswordBinding.dart';
import 'package:amr_mobile/bindings/auth/forgotPasswordBinding.dart';
import 'package:amr_mobile/bindings/auth/loginBinding.dart';
import 'package:amr_mobile/bindings/auth/otpBinding.dart';
import 'package:amr_mobile/bindings/auth/registerBinding.dart';
import 'package:amr_mobile/bindings/auth/welcomeBinding.dart';
import 'package:amr_mobile/bindings/homeBinding.dart';
import 'package:amr_mobile/bindings/introBinding.dart';
import 'package:amr_mobile/bindings/splashBinding.dart';
import 'package:amr_mobile/view/SplashScreen.dart';
import 'package:amr_mobile/view/auth/createNewPasswordView.dart';
import 'package:amr_mobile/view/auth/forgotPasswordView.dart';
import 'package:amr_mobile/view/auth/loginView.dart';
import 'package:amr_mobile/view/auth/otpView.dart';
import 'package:amr_mobile/view/auth/registerView.dart';
import 'package:amr_mobile/view/auth/welcomeView.dart';
import 'package:amr_mobile/view/homeView.dart';
import 'package:amr_mobile/view/introView.dart';
import 'package:get/get.dart';

part 'routes.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => Register(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.FORGOTPASSWORD,
      page: () => ForgotPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => Otp(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => Intro(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.CREATENEWPASSWORD,
      page: () => CreateNewPassword(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => Welcome(),
      binding: WelcomeBinding(),
    ),
  ];
}
