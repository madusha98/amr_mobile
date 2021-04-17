import 'package:amplify_flutter/amplify.dart';
import 'package:amr_mobile/service/httpService.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:amr_mobile/utils/deviceInfo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final HttpService _httpProvider = Get.find();
  final GetStorage storage = Get.find();

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
      if (token != null) {
        storePushToken(token);
      } else {
        storePushToken('noGMS');
        print('This devices doesn\' have google services');
      }
    });

    // Listen to refresh token
    _firebaseMessaging.onTokenRefresh.listen((refreshToken) {
      if (storage.read(StorageKeys.PUSH_TOKEN) != refreshToken) {
        storePushToken(refreshToken);
        updateToken();
      }
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

  void storePushToken(token) {
    storage.write(StorageKeys.PUSH_TOKEN, token);
  }

  void updateToken() async {
    if (storage.hasData(StorageKeys.TOKEN)) {
      var user = await Amplify.Auth.getCurrentUser();
      var token = storage.read(StorageKeys.PUSH_TOKEN);
      if (token != 'noGMS') {
        var deviceId = await getDeviceID();
        var body = <String, dynamic>{
          'deviceId': deviceId,
          'pushToken': token,
          'userId': user.userId
        };
        var res = await _httpProvider.postRequest('/fcm/updatePushToken', body);
        if (res != null) {}
        print(res.body['data']);
      }
    }
  }
}
