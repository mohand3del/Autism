
// import 'dart:io';

// import 'package:autism/core/network/api_service.dart';
// import 'package:autism/core/network/response_model.dart';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';

// class ApiHelper {
//   final ApiService _apiService;
//   ApiHelper({required ApiService apiService}) : _apiService = apiService;

//   Future<ApiResponse> uploadImage(String method, File file) async {
//     String fileName = file.path.split('/').last;
//     MultipartFile multipartFile = await MultipartFile.fromFile(
//       file.path,
//       filename: fileName,
//       contentType: MediaType('image', 'jpeg'),
//     );

//     switch (method) {
//       case 'Picture':
//         return _apiService.uploadChildFace(file);
//       case 'Drawing':
//         return _apiService.uploadDrawing(file);
//       case 'Coloring':
//         return _apiService.uploadColoring(file);
//       case 'Hand Right':
//         return _apiService.uploadHandWriting(file);
//       default:
//         throw Exception("Invalid Method");
//     }
//   }
// }