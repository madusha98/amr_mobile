import 'package:amr_mobile/controller/home/bottomNavController.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  final HttpService _httpProvider = Get.find();

  var amount = '2000'.obs;

  void gotoBillPayments() {
    // ignore: omit_local_variable_types
    BottomNavController bottomNavController = Get.find();
    bottomNavController.navigateToTab(2);
  }

  @override
  void onInit() {
    super.onInit();
    calculateBill(Get.arguments);
  }

  Future<void> calculateBill(data) async {
    var res = await _httpProvider.postRequest('bill/getBillValue', data);
    if (res != null) {
      print(res.body['data']);
    }
  }
}
