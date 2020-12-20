import 'package:amr_mobile/controller/registerController.dart';
import 'package:amr_mobile/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.name.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.email.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.password.value = text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.phone.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) => controller.nic.value = text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'NIC',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Register'),
                      onPressed: controller.register,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Login'),
                      onPressed: () => Get.offNamed(Routes.LOGIN),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
