import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import 'painter.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({Key? key}) : super(key: key);
  static const String id = '/face_detection';

  @override
  State<FaceDetection> createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  UI.Image? image;
  List<Rect> rects = [];
  bool isSmiling = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Face detection")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getImage(),
        child: Icon(Icons.camera),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              FittedBox(
                child: SizedBox(
                  height: image == null ? height / 2 : image!.height.toDouble(),
                  width: image == null ? width : image!.width.toDouble(),
                  child: image == null ? Container() : CustomPaint(painter: Painter(rects, image as UI.Image)),
                ),
              ),
              SizedBox(height: 30),
              image != null
                  ? Text(
                      isSmiling ? "Smiling 😀" : "Not Smiling 😕",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    XFile? imagePickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(imagePickedFile!.path);
    final faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
    final List<Face> faces = await faceDetector.processImage(inputImage);

    rects.clear();
    for (Face face in faces) {
      isSmiling = face.smilingProbability! >= 0.6;
      rects.add(face.boundingBox);
    }

    var bytesFromImageFile = await imagePickedFile.readAsBytes();
    decodeImageFromList(bytesFromImageFile).then((img) {
      setState(() {
        image = img;
      });
    });
  }
}
