import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  return pickedFile != null ? File(pickedFile.path) : null;
}
