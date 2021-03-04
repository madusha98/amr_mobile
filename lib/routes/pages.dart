import 'package:amr_mobile/bindings/homeBinding.dart';
import 'package:amr_mobile/bindings/loginBinding.dart';
import 'package:amr_mobile/bindings/otpBinding.dart';
import 'package:amr_mobile/bindings/registerBinding.dart';
import 'package:amr_mobile/bindings/splashBinding.dart';
import 'package:amr_mobile/bindings/forgotPasswordBinding.dart';
import 'package:amr_mobile/view/homeView.dart';
import 'package:amr_mobile/view/loginView.dart';
import 'package:amr_mobile/view/SplashScreen.dart';
import 'package:amr_mobile/view/otpView.dart';
import 'package:amr_mobile/view/registerView.dart';
import 'package:amr_mobile/view/forgotPasswordView.dart';
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
    )
  ];
}
