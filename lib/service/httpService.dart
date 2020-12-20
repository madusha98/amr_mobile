import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HttpService extends GetConnect {
  var storage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;

    httpClient.addRequestModifier((request) {
      request.headers['Authorization'] = 'Bearer ' + storage.read('token');
      return request;
    });

    // httpClient.addAuthenticator((request) async {
    //   final response = await get("http://yourapi/token");
    //   final token = response.body['token'];
    //   // Set the header
    //   request.headers['Authorization'] = "$token";
    //   return request;
    // });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  Future<dynamic> getRequest(path, params) {
    return get(path);
  }
}
