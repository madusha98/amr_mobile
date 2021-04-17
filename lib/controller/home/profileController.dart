import 'package:amr_mobile/domain/ElectricityAccount.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  GetStorage storage = Get.find();
  var loading = false.obs;
  var name = ''.obs;
  var email = ''.obs;
  var mobile = ''.obs;
  var nic = ''.obs;
  Rx<ElectricityAccount> account;

  final HttpService _httpProvider = Get.find();
  final AuthService _authService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() async {
    loading.value = true;
    var userattributes = await _authService.getUserAttributes();

    // fetch name
    var nameAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'name');
    name.value = nameAttribute.value;

    // fetch email
    var emailAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'email');
    email.value = emailAttribute.value;

    // fetch mobile
    var mobileAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'phone_number');
    mobile.value = mobileAttribute.value;

    // fetch nic
    var nicAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'custom:nic');
    nic.value = nicAttribute.value;

    // fetch electricty account no
    var user = await _authService.getUserDetails();
    var res = await _httpProvider.getRequest('/account/getAccountDetails',
        params: {'userId': user.userId});
    if (res != null) {
      account = ElectricityAccount.fromJson(res.body[0]).obs;
    }

    loading.value = false;
  }

  void logout() {
    _authService.logout();
    storage.remove(StorageKeys.TOKEN);
    storage.remove(StorageKeys.ACCOUNT_ADDED);
    Get.offAllNamed(Routes.SPLASH);
  }
}
