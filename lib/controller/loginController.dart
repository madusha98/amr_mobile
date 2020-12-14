import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amr_mobile/amplifyconfiguration.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GetStorage storage = GetStorage();
  RxBool amplifyConfigured = false.obs;

  Duration get loginTime => Duration(milliseconds: 2250);
  Amplify amplifyInstance = Amplify();

  @override
  void onInit() {
    configureAmplify();
    super.onInit();
  }

  void configureAmplify() async {
    var authPlugin = AmplifyAuthCognito();
    // ignore: unawaited_futures
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    try {
      await amplifyInstance.configure(amplifyconfig);

      amplifyConfigured.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<String> login(LoginData data) async {
    try {
      var res = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      );
      print(res);
      if (res.isSignedIn) {
        await _fetchSession();
      }
    } on AuthError catch (e) {
      print(e);
    }

    return Future.sync(() => null);
  }

  void _fetchSession() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      storage.write('token', res.userPoolTokens.accessToken);
      print(storage.read('token'));
      Get.offNamed(Routes.SPLASH);
    } on AuthError catch (e) {
      print(e);
    }
  }

  Future<String> signup(LoginData data) async {
    try {
      var userAttributes = <String, dynamic>{
        'email': data.name,
      };
      var res = await Amplify.Auth.signUp(
          username: data.name,
          password: data.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      print(res);
    } on AuthError catch (e) {
      print(e);
    }
    // storage.write('token', 'token');
    // print(storage.read('token'));
    // Get.offNamed(Routes.SPLASH);
    return Future.sync(() => null);
  }

  Future<String> recoverPassword(String data) {
    storage.write('token', 'token');
    print(storage.read('token'));
    Get.offNamed(Routes.SPLASH);
    return Future.sync(() => null);
  }
}
