import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:today/screens/ocr/scan_image.dart';
import 'package:today/screens/ocr/widgets/image_list.dart';

import '../face_detection/utils.dart';

class ScannedImages extends StatefulWidget {
  static const String id = '/scanned_images';
  const ScannedImages({Key? key}) : super(key: key);
  @override
  State<ScannedImages> createState() => _ScannedImagesState();
}

class _ScannedImagesState extends State<ScannedImages> {
  bool isGallery = true;
  List<File> imageFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Scanned Images'),
        actions: [
          Container(alignment: Alignment.center, child: Text(isGallery ? 'Gallery' : 'Camera')),
          SizedBox(width: 10),
          SizedBox(
            width: 40,
            child: FittedBox(
              child: CupertinoSwitch(
                value: isGallery,
                onChanged: (val) => setState(() => isGallery = val),
                activeColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: ImageList(imageFiles: imageFiles),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: onClickedButton,
        child: Icon(Icons.add, size: 35, color: Colors.red),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future onClickedButton() async {
    final file = await Utils.pickMedia(
      isGallery: isGallery,
      cropImage: await cropImage,
    );
    if (file == null || file == File('') || file.path == '') return;
    setState(() => imageFiles.add(file));

    Get.toNamed(ScanImage.id, arguments: file);
  }

  Future<File?> cropImage(File imageFile) async {
    return await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      // aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
      ],
      compressQuality: 30,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: androidUiSettingsLocked(),
    );
  }

  AndroidUiSettings androidUiSettingsLocked() {
    return AndroidUiSettings(
      toolbarTitle: 'Crop Image',
      toolbarColor: Colors.red,
      toolbarWidgetColor: Colors.white,
      hideBottomControls: false,
      lockAspectRatio: false,
    );
  }
}
