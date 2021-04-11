import 'package:amr_mobile/service/authService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HttpService extends GetConnect {
  GetStorage storage = Get.find();
  AuthService authService = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = Duration(seconds: 30);
    httpClient.addRequestModifier((request) {
      final token = storage.read(StorageKeys.TOKEN);
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
    httpClient.addAuthenticator((request) async {
      await authService.fetchSession();
      final token = storage.read(StorageKeys.TOKEN);
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
    httpClient.maxAuthRetries = 3;
  }

  Future<dynamic> getRequest(path, {params}) => get(path, query: params ?? {});

  Future<dynamic> postRequest(path, body, {params}) =>
      post(path, body, query: params ?? {});
}
