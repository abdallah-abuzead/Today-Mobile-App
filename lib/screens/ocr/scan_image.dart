import 'dart:io';
import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:today/controllers/language_controller.dart';
import 'package:today/models/language.dart';

import '../face_detection/painter.dart';

class ScanImage extends StatefulWidget {
  const ScanImage({Key? key}) : super(key: key);
  static const String id = '/scan_image';

  @override
  _ScanImageState createState() => _ScanImageState();
}

class _ScanImageState extends State<ScanImage> {
  File croppedImage = Get.arguments;
  String _extractedText = '';
  List selectedLanguages = [];

  ///face detection
  UI.Image? image;
  List<Rect> rects = [];
  bool isSmiling = false;

  @override
  initState() {
    super.initState();
    detectFaces();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GetBuilder<LanguageController>(
      builder: (controller) {
        selectedLanguages = controller.languages.where((lang) => lang.isChecked).toList();
        selectedLanguages = selectedLanguages.map((lang) => lang.name).toList();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Scan Image (OCR)'),
            backgroundColor: Colors.black,
          ),
          body: ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  title: Text(
                    controller.mlKit ? 'Google Ml Kit' : 'Flutter Teaser Act',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: CupertinoSwitch(
                    value: controller.mlKit,
                    onChanged: (val) => controller.mlKit = val,
                    activeColor: Colors.teal,
                  ),
                ),
                SizedBox(height: 5),
                controller.mlKit
                    ? Container()
                    : Container(
                        height: 87,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.languages.length,
                          itemBuilder: (context, i) {
                            Language language = controller.languages[i];
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    language.name.toString(),
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                                  ),
                                  Checkbox(
                                    value: language.isChecked,
                                    onChanged: (value) {
                                      controller.updateLanguage(language);
                                      if (value == true)
                                        selectedLanguages.add(language.name);
                                      else
                                        selectedLanguages.remove(language.name);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: 5),
                // Container(
                //   height: 150,
                //   margin: EdgeInsets.symmetric(horizontal: 15),
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade300,
                //     image: DecorationImage(image: FileImage(croppedImage), fit: BoxFit.cover),
                //   ),
                // ),
                FittedBox(
                  child: SizedBox(
                    height: image == null ? height / 2 : image!.height.toDouble(),
                    width: image == null ? width : image!.width.toDouble(),
                    child: image == null ? Container() : CustomPaint(painter: Painter(rects, image as UI.Image)),
                  ),
                ),
                SizedBox(height: 10),

                rects.isEmpty
                    ? Container()
                    : Text(
                        isSmiling ? "Smiling 😀" : "Not Smiling 😕",
                        style: TextStyle(fontSize: 20),
                      ),
                SizedBox(height: 5),

                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ElevatedButton(
                    child: Text('Scan Image', style: TextStyle(fontSize: 16)),
                    onPressed: () async {
                      controller.isLoading = true;

                      _extractedText = controller.mlKit ? await extractTextByMlKit() : await extractTextByTeaserAct();

                      controller.isLoading = false;
                    },
                  ),
                ),
                SizedBox(height: 20),
                controller.isLoading ? Container() : Icon(Icons.done, size: 40, color: Colors.green),
                Center(
                  child: SelectableText(
                    _extractedText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> extractTextByTeaserAct() async {
    return await FlutterTesseractOcr.extractText(
      croppedImage.path,
      language: selectedLanguages.isEmpty ? 'ara' : selectedLanguages.join('+'),
    );
  }

  Future<String> extractTextByMlKit() async {
    final inputImage = InputImage.fromFilePath(croppedImage.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText = await textDetector.processImage(inputImage);
    textDetector.close();
    return recognisedText.text;
  }

  Future detectFaces() async {
    final inputImage = InputImage.fromFilePath(croppedImage.path);
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

    var bytesFromImageFile = await croppedImage.readAsBytes();
    decodeImageFromList(bytesFromImageFile).then((img) {
      setState(() {
        image = img;
      });
    });
  }
}
