import 'package:amr_mobile/bindings/auth/addAccountBinding.dart';
import 'package:amr_mobile/bindings/auth/createNewPasswordBinding.dart';
import 'package:amr_mobile/bindings/auth/forgotPasswordBinding.dart';
import 'package:amr_mobile/bindings/auth/loginBinding.dart';
import 'package:amr_mobile/bindings/auth/otpBinding.dart';
import 'package:amr_mobile/bindings/auth/registerBinding.dart';
import 'package:amr_mobile/bindings/auth/welcomeBinding.dart';
import 'package:amr_mobile/bindings/billPaymentBinding.dart';
import 'package:amr_mobile/bindings/home/bottomNavBinding.dart';
import 'package:amr_mobile/bindings/home/historyBinding.dart';
import 'package:amr_mobile/bindings/home/homeBinding.dart';
import 'package:amr_mobile/bindings/home/profileBinding.dart';
import 'package:amr_mobile/bindings/introBinding.dart';
import 'package:amr_mobile/bindings/scanBinding.dart';
import 'package:amr_mobile/bindings/scanResultBinding.dart';
import 'package:amr_mobile/bindings/splashBinding.dart';
import 'package:amr_mobile/bindings/successBinding.dart';
import 'package:amr_mobile/bindings/generateBinding.dart';
import 'package:amr_mobile/view/SplashScreen.dart';
import 'package:amr_mobile/view/auth/addAccountView.dart';
import 'package:amr_mobile/view/auth/createNewPasswordView.dart';
import 'package:amr_mobile/view/auth/forgotPasswordView.dart';
import 'package:amr_mobile/view/auth/loginView.dart';
import 'package:amr_mobile/view/auth/otpView.dart';
import 'package:amr_mobile/view/auth/registerView.dart';
import 'package:amr_mobile/view/auth/welcomeView.dart';
import 'package:amr_mobile/view/home/bottomNav.dart';
import 'package:amr_mobile/view/introView.dart';
import 'package:amr_mobile/view/scanView.dart';
import 'package:amr_mobile/view/scanResultView.dart';
import 'package:amr_mobile/view/successView.dart';
import 'package:amr_mobile/view/generateView.dart';
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
    GetPage(name: Routes.HOME, page: () => BottomNav(), bindings: [
      BottomNavBinding(),
      HomeBinding(),
      BillPaymentBinding(),
      ProfileBinding(),
      HistoryBinding()
    ]),
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
    GetPage(
      name: Routes.SUCCESS,
      page: () => Success(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: Routes.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: Routes.SCANRESULT,
      page: () => ScanResult(),
      binding: ScanResultBinding(),
    ),
    GetPage(
      name: Routes.GENERATE,
      page: () => Generate(),
      binding: GenerateBinding(),
    ),
    GetPage(
      name: Routes.ADDACCOUNT,
      page: () => AddAccounnt(),
      binding: AddAccountBinding(),
    ),
  ];
}
