import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/deviceInfo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final HttpService _httpProvider = Get.find();

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    print(message.toString());
  }

  void handleNotifications() {
    // Get token
    _firebaseMessaging.getToken().then((token) {
      updateToken(token);
    });

    // Listen to refresh token
    _firebaseMessaging.onTokenRefresh.listen((refreshToken) {
      updateToken(refreshToken);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      },
    );
  }

  void updateToken(token) async {
    var deviceId = await getDeviceID();
    var body = <String, dynamic>{'deviceId': deviceId, 'pushToken': token};
    var res = await _httpProvider.postRequest('/fcm/updatePushToken', body);
    if (res != null) {}
    print(res.body['data']);
  }
}
