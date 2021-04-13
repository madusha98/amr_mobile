import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  GetStorage storage = Get.find();
  var testMsg = ''.obs;
  var loading = false.obs;

  final HttpService _httpProvider = Get.find();
  final AuthService _authService = Get.find();

  @override
  void onInit() async {
    loading.value = true;
    // var res = await _httpProvider.getRequest('/test', '');
    // if (res != null) {
    //   testMsg.value = res.body['message'];
    // }
    // print(res);
    loading.value = false;

    super.onInit();
  }

  void logout() {
    _authService.logout();
    storage.remove(StorageKeys.TOKEN);
    storage.remove(StorageKeys.ACCOUNT_ADDED);
    Get.offAllNamed(Routes.SPLASH);
  }
}
