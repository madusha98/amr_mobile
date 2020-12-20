import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amr_mobile/controller/homeController.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'title', child: Text('AMR')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.loading.value
                ? CircularProgressIndicator()
                : Text(controller.testMsg.value)),
            RaisedButton(child: Text('Logout'), onPressed: controller.logout),
          ],
        ),
      ),
    );
  }
}
