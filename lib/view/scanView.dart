import 'package:amr_mobile/controller/scanController.dart';
import 'package:amr_mobile/utils/constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanView extends GetView<ScanController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var stackChildren = <Widget>[];

    stackChildren.add(
      Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        right: 0,
        child: Obx(
          () => controller.busy.value != null
              ? Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(controller.cameraController),
                )
              : Center(child: Text('Loading...')),
        ),
      ),
    );

    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Obx(
              () => controller.busy.value != null &&
                      controller.cameraInitilized.value
                  ? Container(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      child: CameraPreview(controller.cameraController),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ),
          Obx(
            () => controller.busy.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: PADDING, top: PADDING * 3, right: PADDING),
            child: Container(
              width: Get.width - PADDING * 2,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.all(PADDING),
                    child: Text(
                      'Please hold the camera towards your meter and keep the counter inside the green box steadily.It will scan automatically.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          Center(
              child: Image.asset(
            'assets/scanIndicator.png',
            height: 200.0,
            fit: BoxFit.cover,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(Icons.close),
        backgroundColor: Get.theme.accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
