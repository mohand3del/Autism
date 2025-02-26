import 'dart:io';

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_error_model.dart';
import 'package:autism/features/profile/data/repo/upload_image_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._uploadImageRepo) : super(UploadImageState.initial());
  final UploadImageRepo _uploadImageRepo;
  final ImagePicker _picker = ImagePicker();

  Future<void> uploadImage() async {
     XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    File image = File(pickedFile.path);
    emit(UploadImageState.loading());
    try {
      await _uploadImageRepo.uploadImage(image);
      emit(UploadImageState.success(image: image));
    } catch (e) {
      emit(UploadImageState.error(ErrorHandler.handle(e).toString()));
    }
  }
}
