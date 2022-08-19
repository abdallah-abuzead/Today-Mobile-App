import 'dart:io';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> pickMedia({
    required bool isGallery,
    Future<File?> Function(File file)? cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return File('');

    ///
    GallerySaver.saveImage(pickedFile.path).then((path) {
      print(path);
    });

    ///
    if (cropImage == null)
      return File(pickedFile.path);
    else
      return cropImage(File(pickedFile.path));
  }
}
