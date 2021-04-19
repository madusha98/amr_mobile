import 'package:amr_mobile/controller/home/homeController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/utils.dart';
import 'package:get/get.dart';

class ScanResultController extends GetxController {
  var loading = true.obs;
  var digits = [].obs;
  var image;
  var responseData;
  var readError = false.obs;
  var progress = 0.0.obs;

  final HttpService _httpProvider = Get.find();
  final HomeController _homeController = Get.find();

  @override
  void onInit() {
    super.onInit();
    uploadImage();
  }

  void uploadImage() async {
    readError.value = false;
    progress.value = 0.25;
    var position = await getPosition().catchError((error) {
      loading.value = false;
      Get.dialog(errorDialog(error.toString()));
    });
    progress.value = 0.5;
    var image = Get.arguments['image'];
    this.image = image;
    final form = FormData({
      'image': await MultipartFile(image,
          filename: 'test.jpg', contentType: 'image/jpg'),
    });
    final params = {
      'accId': _homeController.account.value.accId,
      'location': '${position.latitude},${position.longitude}',
      'quick': Get.arguments['quickScan'] ? '1' : '0'
    };

    var res = await _httpProvider.postRequest('meter_reader/read_digits', form,
        params: params);
    progress.value = 0.9;
    loading.value = false;
    try {
      if (res.statusCode == 200) {
        progress.value = 1;
        var val = res.body['value'];
        digits.value = val.split('');
        responseData = res.body;
        print(responseData);
      } else {
        print(res.bodyString);
        readError.value = true;
      }
    } catch (e) {
      print(e);
      readError.value = true;
    }
  }

  void rescan() {
    Get.offNamed(Routes.SCAN, arguments: {
      'prevRoute': Get.arguments['quickScan'] ? 'quickScan' : ''
    });
  }

  void confirmReading() {
    var lastReadDate = DateTime.fromMillisecondsSinceEpoch(
        responseData['lastReadDate'].toInt());
    var lastReadDateString = lastReadDate.toString().split(' ')[0];
    var currentDate = DateTime.now();
    var currentDateString = currentDate.toString().split(' ')[0];
    if (Get.arguments['quickScan']) {
      Get.toNamed(Routes.QUICKSCANRESULT, arguments: {
        'NoOfUnits': responseData['noOfUnits'],
        'FromDate': lastReadDateString,
        'ToDate': currentDateString,
        'accId': _homeController.account.value.accId,
        'lastReadDate': lastReadDate
      });
    } else {
      Get.toNamed(Routes.SUCCESS, arguments: {
        'NoOfUnits': responseData['noOfUnits'],
        'FromDate': lastReadDateString,
        'ToDate': currentDateString,
        'readingId': responseData['readingId'],
        'accId': _homeController.account.value.accId,
        'quick': '0'
      });
    }
  }
}
