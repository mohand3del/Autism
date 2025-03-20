import 'dart:io';

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/features/community/data/repo/create_post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'create_post_state.dart';
part 'create_post_cubit.freezed.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(this._createPostRepo)
      : super(const CreatePostState.initial());
  final CreatePostRepo _createPostRepo;
  TextEditingController textController = TextEditingController();
  File? selectedImage;

  Future<void> pickImage({bool fromCamera = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(CreatePostState.imageSelected(selectedImage!));
    } else {
      emit(const CreatePostState.error(error: "No image selected"));
    }
  }

  Future<void> createPost({
    required String text,
    required String category,
    required String postType,
    required String method,
    File? image,
  }) async {
    emit(const CreatePostState.loading());
    final result = await _createPostRepo.createPost(
      text: textController.text,
      category: category,
      postType: postType,
      method: method,
      image: selectedImage,
    );
    result.when(success: (data) {
      emit(CreatePostState.success(data));
    }, failure: (error) {
      emit(CreatePostState.error(error: error.apiErrorModel.message.toString()));
    });
  }
}
