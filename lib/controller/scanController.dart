import 'dart:async';
import 'dart:io';

import 'package:amr_mobile/service/tfLiteService.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as Path;
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  TFLiteService tfLiteService = Get.find();

  File image;
  var extractText = '';
  var busy = false.obs;
  var modelLoaded = false.obs;
  List recognitions;
  bool available = true;
  var recognition;

  StreamController<List<dynamic>> recognitionController = StreamController();
  CameraController cameraController;

  @override
  void onInit() async {
    super.onInit();

    busy.value = true;

    startUp();
    loadModel().then(
      (val) {
        busy.value = false;
      },
    );
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    cameraController.stopImageStream();
    super.onClose();
  }

  // initialize camera
  Future startUp() async {
    cameraController = CameraController(
      tfLiteService.camera,
      ResolutionPreset.veryHigh,
    );
    cameraController.initialize().then((value) {
      startStreaming();
    });
  }

  // load tflite model
  Future<bool> loadModel() async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: 'assets/tflite/yolov2-tiny.tflite',
        labels: 'assets/tflite/yolo_labels.txt',
      );
      print(res);
      modelLoaded.value = true;
      return true;
    } on PlatformException catch (e) {
      print('Failed to load the model' + e.toString());
      return false;
    }
  }

  Future<void> startStreaming() async {
    cameraController.startImageStream((img) async {
      try {
        if (available) {
          available = false;
          await runModel(img);
          await Future.delayed(Duration(seconds: 1));
          available = true;
        }
      } catch (e) {
        print('error running model with current frame');
        print(e);
      }
    });
  }

  // run model on video stream
  Future<void> runModel(CameraImage img) async {
    if (modelLoaded.value) {
      var recognitions = await Tflite.detectObjectOnFrame(
          bytesList: img.planes.map((plane) => plane.bytes).toList(),
          imageHeight: img.height,
          imageWidth: img.width,
          model: 'YOLO',
          threshold: 0.3,
          imageMean: 0.0,
          imageStd: 255.0,
          numResultsPerClass: 1);
      print(recognitions);
      if (recognitions.isNotEmpty) {
        if (recognitions[0]['confidenceInClass'] > 0.90) {
          captureImage(img, recognitions[0]);
          cameraController.stopImageStream();
        }

        recognition = recognitions[0];
      } else {
        recognition = null;
      }
    }
  }

  void runModelOnImage(File image) async {
    if (modelLoaded.value) {
      var recognitions = await Tflite.detectObjectOnImage(
          path: image.path,
          model: 'YOLO',
          threshold: 0.3,
          imageMean: 0.0,
          imageStd: 255.0,
          numResultsPerClass: 1);
      print(recognitions);
      if (recognitions.isNotEmpty) {
        print(recognitions);
        tfLiteService.cropImage(image, recognitions[0]);

        busy.value = false;
      }
    } else {
      recognition = null;
    }
  }

  void captureImage(CameraImage image, recognition) async {
    final path = Path.join(
        (await getExternalStorageDirectory()).path, '${DateTime.now()}.png');
    tfLiteService
        .convertYUV420toImageColor(image, recognition)
        .then((value) async {
      var pngEncoder = imglib.PngEncoder(level: 0, filter: 0);
      var file = File(path)..writeAsBytesSync(pngEncoder.encodeImage(value));
      runModelOnImage(file);
    });
  }

  void start() {
    busy.value = true;

    startUp();
    loadModel().then((val) {
      busy.value = false;
    });
  }

  Future<void> selectFromImagePicker() async {
    await loadModel();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    busy.value = true;
    runModelOnImage(image);
  }
}
