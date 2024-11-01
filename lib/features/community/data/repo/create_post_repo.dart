import 'dart:developer';
import 'dart:io';
import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/community/data/model/create_post_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CreatePostRepo {
  final ApiService _apiService;

  CreatePostRepo(this._apiService);

  Future<ApiResult<CreatePostResponse>> createPost({
    required String text,
    required String category,
    required String postType,
    required String method,
    File? image,
  }) async {
    try {
      MultipartFile? imageMultipart;
      if (image != null) {
        // Convert the image file to MultipartFile with the correct filename
        imageMultipart = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType("image", "png"),
        );
      }

      // Construct FormData with "files" as the key
      final formData = FormData.fromMap({
        "text": text,
        "category": category,
        "postType": postType,
        "method": method,
        if (imageMultipart != null) "files": [imageMultipart], // "files" matches the backend requirement
      });

      // Log for debugging
      log("FormData fields: ${formData.fields}");
      log("FormData files: ${formData.files}");

      // Send request
      final response = await _apiService.createPost(formData);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}