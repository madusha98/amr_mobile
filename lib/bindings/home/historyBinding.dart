import 'package:amr_mobile/controller/home/historyController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
