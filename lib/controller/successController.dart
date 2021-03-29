import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  final HttpService _httpProvider = Get.find();

  var amount = '2000'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    calculateBill(Get.arguments);
  }

  Future<void> calculateBill(data) async {
    var res = await _httpProvider.postRequest('billValue/getBillValue', data);
    if (res != null) {
      print(res.body['data']);
    }
  }
}
