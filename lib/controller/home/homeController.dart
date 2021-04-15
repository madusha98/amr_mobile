import 'package:amr_mobile/domain/ElectricityAccount.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';

class HomeController extends GetxController {
  GetStorage storage = Get.find();
  var loading = false.obs;
  var name = ''.obs;
  Rx<ElectricityAccount> account;
  Rx<DateTime> lastScanned;
  Rx<DateTime> nextScanDue;

  final HttpService _httpProvider = Get.find();
  final AuthService _authService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() async {
    loading.value = true;
    var user = await _authService.getUserDetails();
    var userattributes = await _authService.getUserAttributes();
    var nameAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'name');
    name.value = nameAttribute.value;

    var res = await _httpProvider.getRequest('/account/getAccountDetails',
        params: {'userId': user.userId});
    if (res != null) {
      account = ElectricityAccount.fromJson(res.body[0]).obs;
      calculateDates();
    }
    loading.value = false;
  }

  void calculateDates() {
    lastScanned =
        DateTime.fromMillisecondsSinceEpoch(account.value.lastReadDate).obs;
    nextScanDue = Jiffy(lastScanned.value).add(months: 1).dateTime.obs;
  }

  void logout() {
    _authService.logout();
    storage.remove(StorageKeys.TOKEN);
    storage.remove(StorageKeys.ACCOUNT_ADDED);
    Get.offAllNamed(Routes.SPLASH);
  }
}
