// ignore_for_file: must_be_immutable

import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  Uint8List? image;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white.withOpacity(0.4),
      child: widget.image != null
          ? CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(0.4),
              backgroundImage: MemoryImage(widget.image!),
            )
          : CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(0.4),
              backgroundImage: const NetworkImage(
                "https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg",
              ),
            ),
    );
  }
}
