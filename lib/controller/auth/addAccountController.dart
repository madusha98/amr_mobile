import 'package:amr_mobile/domain/Request/ElectricityAccount.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAccountController extends GetxController {

  var accountNo = ''.obs;
  var accountName = ''.obs;
  var serviceProvider = ''.obs;

  var accountNoError = ''.obs;
  var accountNameError = ''.obs;

  var loading = false.obs;

  final HttpService _httpProvider = Get.find();
  final AuthService _authService = Get.find();
  final GetStorage storage = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void addAccount() async {
    loading.value = true;
    var position = await getPosition().catchError((error) {
      loading.value = false;
      Get.dialog(errorDialog(error.toString()));
    });
    if (position == null) return;

    var user = await _authService.getUserDetails();
    var body = ElectricityAccount(
        userId: user.userId,
        accId: '1234',
        accNo: accountNo.value,
        location: '${position.latitude},${position.longitude}',
        outstanding: '');

    var res =
        await _httpProvider.postRequest('/account/addAccount', body.toAwsJson);
    loading.value = false;

    if (res.statusCode == 200) {
      Get.snackbar('Success', 'Account added successfullly!');
      storage.write(StorageKeys.ACCOUNT_ADDED, 'true');
      Get.offAllNamed(Routes.SPLASH);
    } else {
      print(res.bodyString);
      Get.snackbar('Error', 'Something went wrong');
    }
  }
}
