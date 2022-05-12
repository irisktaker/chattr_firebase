import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chattr/shared/constants.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget(
    this.imagePickFn, {
    Key? key,
  }) : super(key: key);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile = await _picker.pickImage(
      source: src,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });

      widget.imagePickFn(_pickedImage!);
    } else {
      print("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAlertDialog(context);
      },
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white.withOpacity(0.4),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white.withOpacity(0.4),
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          MaterialButton(
            onPressed: () {
              // TODO: ___
            },
            child: const Text(
              "Delete Photo",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
            child: const Text(
              "Take Photo",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: const Text(
              "Choose Photo",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
