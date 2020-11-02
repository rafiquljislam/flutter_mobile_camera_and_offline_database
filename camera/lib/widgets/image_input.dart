import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _stroageImage;
  final picker = ImagePicker();
  Future<void> _takePicture() async {
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _stroageImage = File(imageFile.path);
      print(_stroageImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _stroageImage != null
              ? Image.file(
                  _stroageImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Center(child: Text("No Image I Hare")),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text("Take Picture"),
            textColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
