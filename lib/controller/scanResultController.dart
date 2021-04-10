import 'package:amr_mobile/service/httpService.dart';
import 'package:get/get.dart';

class ScanResultController extends GetxController {
  var loading = true.obs;
  var digits = [].obs;
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
    final params = {'accId': 'abc'};
    var res = await _httpProvider.postRequest('meter_reader/read_digits', form,
        params: params);
    loading.value = false;
    try {
      var val = res.body['value'];
      digits.value = val.split('');
    } catch (e) {
      print(e);
    }
  }
}
