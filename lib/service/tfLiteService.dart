import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as Path;
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class TFLiteService {
  final CameraDescription camera;

  TFLiteService(this.camera);

  Future<imglib.Image> convertYUV420toImageColor(
      CameraImage image, recognition) async {
    try {
      final width = image.width;
      final height = image.height;
      final uvRowStride = image.planes[1].bytesPerRow;
      final uvPixelStride = image.planes[1].bytesPerPixel;

      print('uvRowStride: ' + uvRowStride.toString());
      print('uvPixelStride: ' + uvPixelStride.toString());

      // imgLib -> Image package from https://pub.dartlang.org/packages/image
      var img = imglib.Image(width, height); // Create Image buffer

      // Fill image buffer with plane[0] from YUV420_888
      for (var x = 0; x < width; x++) {
        for (var y = 0; y < height; y++) {
          final uvIndex =
              uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
          final index = y * width + x;

          final yp = image.planes[0].bytes[index];
          final up = image.planes[1].bytes[uvIndex];
          final vp = image.planes[2].bytes[uvIndex];
          // Calculate pixel color
          int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
          int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
              .round()
              .clamp(0, 255);
          int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
          // color: 0x FF  FF  FF  FF
          //           A   B   G   R
          img.data[index] = (0xFF << 24) | (b << 16) | (g << 8) | r;
        }
      }

      var rotated = imglib.copyRotate(img, 90);
      return rotated;
    } catch (e) {
      print('>>>>>>>>>>>> ERROR:' + e.toString());
    }
    return null;
  }

  void cropImage(File image, recognition) async {
    var decoded = imglib.decodeImage(File(image.path).readAsBytesSync());
    var width = decoded.width;
    var height = decoded.height;

    int x = ((recognition['rect']['x']) * width).round();
    int y = ((recognition['rect']['y']) * height).round();
    int w = ((recognition['rect']['w']) * width).round();
    int h = ((recognition['rect']['h']) * height).round();
    var cropped = imglib.copyCrop(decoded, x, y, w, h);
    final path = Path.join(
        (await getExternalStorageDirectory()).path, '${DateTime.now()}.png');
    var pngEncoder = imglib.PngEncoder(level: 0, filter: 0);
    var file = File(path)..writeAsBytesSync(pngEncoder.encodeImage(cropped));

    // imglib.PngEncoder pngEncoder = new imglib.PngEncoder(level: 0, filter: 0);
    //   return pngEncoder.encodeImage(cropped);
  }
}
