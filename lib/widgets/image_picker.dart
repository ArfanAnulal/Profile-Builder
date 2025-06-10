import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File) onImageSelected; 
  const ImagePickerWidget({super.key,required this.onImageSelected});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      widget.onImageSelected(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _pickImage(ImageSource.gallery),
      child: Row(
        children: [
          CircleAvatar(
                    radius: 20,
                    backgroundImage: _image != null 
      ? FileImage(_image!) as ImageProvider 
      : const NetworkImage('https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png'),
                  ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 36),
            child: const Text('Choose Image'),
          ),
        ],
      ),

    );
  }
}
