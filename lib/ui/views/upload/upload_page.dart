import 'dart:io';

import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  final String houseName;

  const UploadPage({super.key, required this.houseName});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final List<XFile?> _images = [];
  final ImagePicker _picker = ImagePicker();
  final int maxImages = 6;

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        if (_images.length < maxImages) {
          _images.add(photo);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorIndigo,
              content: Text("You can only select up to 6 images."),
            ),
          );
        }
      });
    }
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();

      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        if (_images.length + pickedFiles.length > maxImages) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorIndigo,
              content: Text("You can select up to 6 images."),
            ),
          );
        } else {
          setState(() {
            _images.addAll(pickedFiles);
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: colorIndigo,
            content: Text("Please select images"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error selecting images: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //page title home name
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_work, color: colorIndigo),
                  const SizedBox(width: 15),
                  Text(
                    widget.houseName,
                    style: TextStyle(fontSize: 27),
                  ),
                ],
              ),
            ),
            //add text
            Text(
              "Add Photo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //circle avatar or selected image
            Padding(
              padding: const EdgeInsets.all(17),
              child: _image == null
                  ? CircleAvatar(
                      backgroundColor: colorWhite,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 70,
                        color: colorIndigo,
                      ),
                      radius: 60,
                    )
                  : Image.file(
                      _image!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
            //take a photo button
            ElevatedButton(
              onPressed: _takePhoto,
              child: Text(
                "Take a Photo",
                style: TextStyle(
                    fontSize: 19,
                    color: colorIndigo,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Select from Library
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: _pickImages,
                child: Text(
                  "Select from Library",
                  style: TextStyle(
                      fontSize: 19,
                      color: colorIndigo,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Grid view for selected images
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: maxImages,
                itemBuilder: (context, index) {
                  if (index < _images.length) {
                    return Image.file(
                      File(_images[index]!.path),
                      fit: BoxFit.cover,
                    );
                  } else {
                    return GestureDetector(
                      onTap: _images.length < maxImages ? _pickImages : null,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_photo_alternate,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
