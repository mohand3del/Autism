import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:mime/mime.dart';
import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class UploadImageRepo {
  final ApiService _apiService;
  UploadImageRepo(this._apiService);

  Future<ApiResult<ApiResponse>> uploadImage(File image) async {
    try {
    
      if (image == null) {
        throw ArgumentError('Image file cannot be null');
      }
      if (!image.existsSync()) {
        throw Exception('Image file does not exist');
      }

      // Determine the content type dynamically
      final contentType =
          MediaType.parse(lookupMimeType(image.path) ?? 'image/jpeg');

      // Convert the image file to MultipartFile
      final imageMultipart = await MultipartFile.fromFile(
        image.path,
        filename: p.basename(image.path),
        contentType: contentType,
      );

    
      final formData = FormData.fromMap({
        "file": imageMultipart,
        "description": "Optional description", 
      });

     
      final response = await _apiService.uploadImage(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
