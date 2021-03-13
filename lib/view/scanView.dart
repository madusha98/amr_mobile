import 'package:amr_mobile/controller/scanController.dart';
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
        child: controller.cameraController.value != null
            ? Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: CameraPreview(controller.cameraController),
              )
            : Text('Loading...'),
      ),
    );

    if (controller.busy.value) {
      stackChildren.add(Center(
        child: CircularProgressIndicator(),
      ));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Stack(
          children: stackChildren,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: 'Pick Image from gallery',
        onPressed: controller.start,
      ),
    );
  }
}
