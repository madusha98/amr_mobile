import 'package:amr_mobile/domain/ElectricityAccount.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAccountController extends GetxController {
  var accountNo = ''.obs;
  var accountName = ''.obs;
  var serviceProvider = ''.obs;
  var outstanding = ''.obs;
  var lastScanDate = ''.obs;
  var lastReading = ''.obs;

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

    var lastScanTimestamp = DateTime.parse(lastScanDate.value);
    var user = await _authService.getUserDetails();
    var body = ElectricityAccount(
        userId: user.userId,
        accNo: accountNo.value,
        accName: accountName.value,
        lastReadDate: lastScanTimestamp.millisecondsSinceEpoch,
        lastReading: lastReading.value,
        outstanding: outstanding.value,
        location: '${position.latitude},${position.longitude}');

    var res =
        await _httpProvider.postRequest('/account/addAccount', body.toAwsJson);
    loading.value = false;

    if (res.statusCode == 200) {
      Get.snackbar('Success', 'Account added successfullly!');
      storage.write(StorageKeys.ACCOUNT_ADDED, 'true');
      Get.offAllNamed(Routes.SPLASH);
    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print(picked);
    if (picked != null) {
      lastScanDate.value = picked.toString().split(' ')[0];
    }
  }
}
