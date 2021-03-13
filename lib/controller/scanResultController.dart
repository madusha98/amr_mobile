import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class ScanResultController extends GetxController {
  var loading = true.obs;
  var result = [];
  var digit1 = ''.obs;
  var digit2 = ''.obs;
  var digit3 = ''.obs;
  var digit4 = ''.obs;
  var digit5 = ''.obs;
  var image;

  final HttpService _httpProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    uploadImage();
  }

  void uploadImage() async {
    var image = Get.arguments['image'];
    this.image = image;
    final form = FormData({
      'image': await MultipartFile(image,
          filename: 'test.jpg', contentType: 'image/jpg'),
    });
    var res = await _httpProvider.postRequest('meter_reader/read_digits', form);
    loading.value = false;
    try {
      var val = res.body['value'];
      result = val.split('');
      digit1.value = result[0];
      digit2.value = result[1];
      digit3.value = result[2];
      digit4.value = result[3];
      digit5.value = result[4];
    } catch (e) {
      print(e);
    }
  }
}
