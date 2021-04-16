import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  GetStorage storage = Get.find();
  var loading = false.obs;
  var name = ''.obs;
  final AuthService _authService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() async {
    loading.value = true;
    var userattributes = await _authService.getUserAttributes();
    var nameAttribute = userattributes
        .firstWhere((element) => element.userAttributeKey == 'name');
    name.value = nameAttribute.value;
    loading.value = false;
  }

  void logout() {
    _authService.logout();
    storage.remove(StorageKeys.TOKEN);
    storage.remove(StorageKeys.ACCOUNT_ADDED);
    Get.offAllNamed(Routes.SPLASH);
  }
}
