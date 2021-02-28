import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HttpService extends GetConnect {
  var storage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<dynamic> getRequest(path, {params, token = ''}) {
    var headers = {'Authorization': 'Bearer ' + token};
    return get(path);
  }

  Future<dynamic> postRequest(path, body, {token = ''}) {
    var headers = {'Authorization': 'Bearer ' + token};
    return post(path, body, headers: headers);
  }
}
