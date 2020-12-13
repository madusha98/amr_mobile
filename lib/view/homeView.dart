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
        child:
            RaisedButton(child: Text('Logout'), onPressed: controller.logout),
      ),
    );
  }
}
