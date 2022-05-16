// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:chattr/shared/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chattr/controllers/auth_controller.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key? key, required this.image}) : super(key: key);

  Uint8List? image;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  _pickedImageFromGallery() async {
    Uint8List _image =
        await AuthController().pickImage(ImageSource.gallery);
    setState(() => widget.image = _image);
  }

  _pickedImageFromCamera() async {
    Uint8List _image =
        await AuthController().pickImage(ImageSource.camera);
    setState(() => widget.image = _image);
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
              _pickedImageFromCamera();
            },
            child: const Text(
              "Take Photo",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              _pickedImageFromGallery();
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
