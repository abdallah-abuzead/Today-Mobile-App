import 'dart:io';

import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key? key, required this.imageFiles}) : super(key: key);
  final List<File> imageFiles;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: imageFiles
          .map((imageFile) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(imageFile),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
