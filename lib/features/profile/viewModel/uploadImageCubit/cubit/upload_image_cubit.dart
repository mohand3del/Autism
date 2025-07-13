import 'dart:io';

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/features/profile/data/repo/upload_image_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._uploadImageRepo) : super(const UploadImageState.initial());

  final UploadImageRepo _uploadImageRepo;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage; // Store selected image

  File? get selectedImage => _selectedImage; // Getter for the UI

  Future<void> uploadImage() async {
    if (isClosed) return;

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      emit(const UploadImageState.error('No image selected'));
      return;
    }

    final File image = File(pickedFile.path);
    _selectedImage = image; // Store the new image locally

    emit(const UploadImageState.loading());

    try {
      await _uploadImageRepo.uploadImage(image);
      emit(UploadImageState.success(image: image));
    } catch (e) {
      emit(UploadImageState.error(ErrorHandler.handle(e).toString()));
    }
  }
}
