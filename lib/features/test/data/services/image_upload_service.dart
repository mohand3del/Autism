import 'dart:developer';
import 'dart:io';

import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:quickalert/quickalert.dart';

class ImageUploadService {
  final Dio _dio = Dio();
  static const String baseUrl =
      'https://autism-app.onrender.com/api/v1/testing';

  final Map<String, String> methodApiMap = {
    'Picture': '$baseUrl/childFace',
    'Drawing': '$baseUrl/drawing',
    'Coloring': '$baseUrl/coloring',
    'Hand write': '$baseUrl/handWriting',
  };

  Future<bool> uploadImage(
      File imageFile, String selectedMethod, BuildContext context) async {
    try {
      // Extract file name
      String fileName = imageFile.path.split('/').last;

      // Read the file as bytes and print the file size
      final fileBytes = await imageFile.readAsBytes();
      log('File size: ${fileBytes.length} bytes');

      // Prepare FormData
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      // Print file details and FormData
      log('Sending file: ${imageFile.path}');
      log('FormData fields: ${formData.fields}');
      log('FormData files: ${formData.files}');

      // Get the API URL based on the selected method
      String? apiUrl = methodApiMap[selectedMethod];
      log('API URL: $apiUrl');

      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Token: $token');

      if (apiUrl != null) {
        Response response = await _dio.post(
          apiUrl,
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'multipart/form-data',
              'Accept': 'application/json',
            },
          ),
        );

        log('Response status: ${response.statusCode}');
        log('Response data: ${response.data}');
        log('Response headers: ${response.headers}');

        // Check the response status
        if (response.statusCode == 200) {
          log('Image uploaded successfully');
          return true;
        } else {
          log('Image upload failed with status code: ${response.statusCode}');
          _showErrorAlert(context, 'Status code: ${response.statusCode}');
          return false;
        }
      } else {
        log('No API URL found for selected method');
        _showErrorAlert(context, 'No API URL found for the selected method');
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        log('DioException: ${e.message}');
        log('Response data: ${e.response?.data}');
        log('Response headers: ${e.response?.headers}');
        log('Response status: ${e.response?.statusCode}');
        _showErrorAlert(
          context,
          'Failed to upload image: ${e.response?.data}\nStatus code: ${e.response?.statusCode}',
        );
      } else {
        log('Error: $e');
        _showErrorAlert(context, 'An unexpected error occurred: ${e}');
      }
      return false;
    }
  }

  void _showErrorAlert(BuildContext context, String error) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, $error',
    );
  }
}
