import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amr_mobile/amplifyconfiguration.dart';
import 'package:amr_mobile/domain/User.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:amplify_flutter/amplify.dart';

class AuthService extends GetxService {
  // Amplify amplifyInstance = Amplify();
  GetStorage storage = Get.find();
  RxBool amplifyConfigured = false.obs;

  @override
  void onInit() {
    configureAmplify();
    super.onInit();
  }

  void configureAmplify() async {
    var authPlugin = AmplifyAuthCognito();
    Amplify.addPlugin(authPlugin);
    try {
      await Amplify.configure(amplifyconfig);
      amplifyConfigured.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> login(String email, String password) async {
    await logout();
    try {
      var res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      return res.isSignedIn;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.message);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      var res = await Amplify.Auth.signOut();
      print(res);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> fetchSession() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      storage.write('token', res.userPoolTokens.idToken);
      print('id token ' + res.userPoolTokens.idToken);
      print('access ' + res.userPoolTokens.accessToken);

      return true;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.message);
      return false;
    }
  }

  Future<dynamic> signup(User user) async {
    try {
      var res = await Amplify.Auth.signUp(
          username: user.email,
          password: user.password,
          options: CognitoSignUpOptions(userAttributes: user.toAwsJson));
      print(res);
      return res;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.message);
    }
  }

  Future<dynamic> confirmSignUp(String email, String otp) async {
    try {
      var res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: otp);
      return res;
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<dynamic> resendCode(String email) async {
    try {
      var res = await Amplify.Auth.resendSignUpCode(username: email);
      Get.snackbar('', 'Otp sent successfully!');
      return res;
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<ResetPasswordResult> forgotPassword(String email) async {
    try {
      var res = await Amplify.Auth.resetPassword(username: email);
      Get.snackbar('', 'Otp sent successfully');
      return res;
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
      return null;
    }
  }

  Future<UpdatePasswordResult> confirmPassword(
      String email, String password, String otp) async {
    try {
      var res = await Amplify.Auth.confirmPassword(
          username: email, newPassword: password, confirmationCode: otp);
      Get.snackbar('', 'Password reset successfull!');
      return res;
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
      return null;
    }
  }

  Future<UpdatePasswordResult> createNewPassword(
          String newpassword, String confirmpassword) async =>
      null;
}
