import 'package:amr_mobile/controller/billPaymentController.dart';
import 'package:amr_mobile/controller/home/bottomNavController.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  final HttpService _httpProvider = Get.find();

  var amount = ''.obs;
  var fromdate = ''.obs;
  var todate = ''.obs;
  var loading = false.obs;
  var noOfUnits = ''.obs;

  BillPaymentController billPaymentController = Get.find();
  BottomNavController bottomNavController = Get.find();

  void gotoBillPayments() {
    // billPaymentController.paymentAmount.value = amount.value;
    billPaymentController.amountTextField.value.text = amount.value;
    bottomNavController.navigateToTab(2);
  }

  @override
  void onInit() {
    super.onInit();
    noOfUnits.value = Get.arguments['NoOfUnits'].toString();
    calculateBill(Get.arguments);
  }

  Future<void> calculateBill(data) async {
    loading.value = true;
    var res = await _httpProvider.postRequest('bill/getBillValue', data);
    try {
      if (res != null && res.statusCode == 200) {
        amount.value = res.body['Total'];
        fromdate.value = res.body['fromDate'];
        todate.value = res.body['toDate'];
      } else {
        print(res.bodyString);
      }
      loading.value = false;
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }
}
