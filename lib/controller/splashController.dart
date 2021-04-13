import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/fcmService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  final GetStorage storage = Get.find();
  final FCMService _fcmService = FCMService();
  final AuthService _authService = Get.find();
  final HttpService _httpProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    _fcmService.handleNotifications();
  }

  void checkLoginStatus() async {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 100), () {
      if (storage.hasData(StorageKeys.IS_FIRST_TIME)) {
        isLoading.value = false;
        if (storage.hasData(StorageKeys.TOKEN)) {
          if (storage.hasData(StorageKeys.ACCOUNT_ADDED)) {
            Get.offNamed(Routes.HOME);
          } else {
            checkAccountStatus();
          }
        } else {
          Get.offNamed(
            Routes.LOGIN,
          );
        }
      } else {
        isLoading.value = false;
        Get.offNamed(Routes.INTRO);
      }
    });
  }

  void checkAccountStatus() async {
    var accountAlreadyadded = await hasAccount().catchError((error) {
      print(error);
    });
    if (accountAlreadyadded) {
      Get.dialog(twoButtonDialog(
        'Message',
        'You already have an electricity account associated with current user. Do you want to continue using it?',
        'No',
        () {
          Get.offAllNamed(Routes.ADDACCOUNT);
        },
        'Yes',
        () {
          storage.write(StorageKeys.ACCOUNT_ADDED, 'true');
          Get.offAllNamed(Routes.HOME);
        },
      ));
    } else {
      Get.offAllNamed(Routes.ADDACCOUNT);
    }
  }

  Future<bool> hasAccount() async {
    var user = await _authService.getUserDetails();
    var res = await _httpProvider.getRequest('/account/getAccountDetails',
        params: {'userId': user.userId});
    if (res.statusCode == 200) {
      return res.body.length > 0;
    }
    return Future.error('Something went wrong');
  }

  @override
  void onReady() {
    super.onReady();
  }
}
