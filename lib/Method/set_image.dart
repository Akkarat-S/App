import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SetImage {
  File? file;
  String pathImage = '';

  getImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      file = await File(result!.path);
      //editprofile.Image = File(result!.path);
    } catch (e) {}

    //print("Image:$file");
    pathImage = file.toString();

    return file;
  }
}
