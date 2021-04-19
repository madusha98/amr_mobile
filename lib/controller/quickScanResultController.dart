import 'package:amr_mobile/controller/home/homeController.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class QuickScanResultsController extends GetxController {
  final HttpService _httpProvider = Get.find();
  var loading = false.obs;
  var fromdate = ''.obs;
  var todate = ''.obs;
  var noOfUnits = ''.obs;
  var amount = ''.obs;
  var currentDate = ''.obs;

  final HomeController _homeController = Get.find();
  var now = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    noOfUnits.value = Get.arguments['NoOfUnits'].toString();
    currentDate.value = '${now.year}/${now.month}/${now.day}';
    calculateBill(Get.arguments);
  }

  Future<void> calculateBill(data) async {
    var toDate = (data['lastReadDate'] as DateTime)
        .add(Duration(days: 30))
        .toString()
        .split(' ')[0];

    var d = DateTime.parse(Get.arguments['ToDate']);
    var days = d.difference(data['lastReadDate'] as DateTime).inDays;
    var units = (Get.arguments['NoOfUnits'].toInt() / days) * 30;

    var body = {
      'NoOfUnits': units.toInt().toString(),
      'FromDate': data['FromDate'],
      'ToDate': toDate,
      'readingId': 'quickScan',
      'accId': _homeController.account.value.accId,
      'quick': '1'
    };

    loading.value = true;
    var res = await _httpProvider.postRequest('bill/getBillValue', body);
    try {
      if (res != null && res.statusCode == 200) {
        fromdate.value = res.body['fromDate'];
        todate.value = res.body['toDate'];
        amount.value = res.body['Total'];
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
