import 'package:get/get.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class BillPaymentController extends GetxController {
  void pay() {
    var paymentObject = {
      'sandbox': true, // true if using Sandbox Merchant ID
      'merchant_id': '1216984', // Replace your Merchant ID
      'merchant_secret': 'xyz', // See step 4e
      'notify_url': 'http://sample.com/notify',
      'order_id': 'ItemNo12345',
      'items': 'Hello from Flutter!',
      'amount': '50.00',
      'currency': 'LKR',
      'first_name': 'Saman',
      'last_name': 'Perera',
      'email': 'samanp@gmail.com',
      'phone': '0771234567',
      'address': 'No.1, Galle Road',
      'city': 'Colombo',
      'country': 'Sri Lanka',
      'delivery_address': 'No. 46, Galle road, Kalutara South',
      'delivery_city': 'Kalutara',
      'delivery_country': 'Sri Lanka',
      'custom_1': '',
      'custom_2': ''
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      print('One Time Payment Success. Payment Id: $paymentId');
    }, (error) {
      print('One Time Payment Failed. Error: $error');
    }, () {
      print('One Time Payment Dismissed');
    });
  }
}
