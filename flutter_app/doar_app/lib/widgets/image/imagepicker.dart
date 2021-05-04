import 'dart:io';
import 'package:flutter/material.dart';
import 'package:doar_app/design/layoutcolors.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File image) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final picker = ImagePicker();

  late File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 300,
      maxHeight: 300,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.imagePickFn(_image);
      } else {
        print('Sem imagem.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: lightgreyBackgroundColor,
          // FIXME atualizar
          backgroundImage: _image == null
              ? AssetImage("images/profile.png")
              : FileImage(_image),
        ),
        ElevatedButton.icon(
          onPressed: getImage,
          icon: Icon(Icons.image),
          label: Text('Adicione uma imagem'),
        ),
      ],
    );
  }
}
