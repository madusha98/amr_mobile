import 'dart:ui';
import 'package:amr_mobile/controller/home/profileController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetView<ProfileController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Get.theme.primaryColor, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 22,
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    content: Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Cancel',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: controller.logout,
                        child: Text(
                          'Yes',
                          style: (TextStyle(
                              color: Get.theme.accentColor,
                              fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: BACKGROUND_COLOR,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(PADDING),
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile.png',
                            height: 125,
                            width: 125,
                            fit: BoxFit.cover,
                          ),
                        ),
                        backgroundColor: Colors.black12,
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: Get.theme.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: PADDING,
                        right: PADDING,
                        left: PADDING,
                        bottom: PADDING - 10),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PADDING, left: PADDING),
                  child: TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: '${controller.name}'),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: PADDING,
                        right: PADDING,
                        left: PADDING,
                        bottom: PADDING - 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PADDING, left: PADDING),
                  child: TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: '${controller.email}'),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: PADDING,
                        right: PADDING,
                        left: PADDING,
                        bottom: PADDING - 10),
                    child: Text(
                      'Mobile',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PADDING, left: PADDING),
                  child: TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: '${controller.mobile}'),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: PADDING,
                        right: PADDING,
                        left: PADDING,
                        bottom: PADDING - 10),
                    child: Text(
                      'NIC',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PADDING, left: PADDING),
                  child: TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: '${controller.nic}'),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: PADDING,
                        right: PADDING,
                        left: PADDING,
                        bottom: PADDING - 10),
                    child: Text(
                      'Electricity Account No',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PADDING, left: PADDING),
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(
                        text: controller.account != null
                            ? controller.account.value.accNo
                            : ''),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
