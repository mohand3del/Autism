import 'dart:developer';
import 'dart:io';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/widgets/custom_bottom_loading_handler.dart';
import 'package:autism/core/widgets/custom_image_bottom.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:http_parser/http_parser.dart';

import 'circular_container_with_image.dart';
import 'tips_container.dart';

class ImageMethodSection extends StatefulWidget {
  final int currentImageStep;
  final List<String> selectedMethods;
  final VoidCallback onNextStep;

  const ImageMethodSection({
    super.key,
    required this.currentImageStep,
    required this.selectedMethods,
    required this.onNextStep,
  });

  @override
  State<ImageMethodSection> createState() => _ImageMethodSectionState();
}

class _ImageMethodSectionState extends State<ImageMethodSection>
    with SingleTickerProviderStateMixin {
  File? _image;
  final Dio _dio = Dio();
  bool _isLoading = false;
  late AnimationController _animationController;

  final Map<String, String> methodApiMap = {
    'Picture': 'https://autism-app.onrender.com/api/v1/testing/childFace',
    'Drawing': 'https://autism-app.onrender.com/api/v1/testing/drawing',
    'Coloring': 'https://autism-app.onrender.com/api/v1/testing/coloring',
    'Hand Right': 'https://autism-app.onrender.com/api/v1/testing/handWriting',
  };

  late String _selectedMethod;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _selectedMethod = widget.selectedMethods[widget.currentImageStep - 1];
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageMethods =
    widget.selectedMethods.where((method) => method != 'Form').toList();
    final imageMethodIndex = widget.currentImageStep - 1;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
          child: StepProgressIndicator(
            totalSteps: imageMethods.length,
            currentStep: imageMethodIndex + 1,
            size: 6,
            padding: 4,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey[300]!,
            roundedEdges: const Radius.circular(3),
          ),
        ),
        verticalSpace(context.height * 20 / 852),
        Expanded(
          child: _image == null && imageMethodIndex < imageMethods.length
              ? _buildImageMethodWidget(imageMethods[imageMethodIndex], context)
              : Column(
            children: [
              verticalSpace(context.height * 20 / 852),
              SizedBox(
                height: context.height * 500 / 852,
                width: context.width * 350 / 393,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: Image.file(
                    fit: BoxFit.cover,
                    _image!,
                    height: 200,
                  ),
                ),
              ),
              verticalSpace(context.height * 30 / 852),
              CustomBottomLoadingHandler(
                child: _isLoading
                    ? Center(
                  child: SpinKitFadingCube(
                    color: AppColors.white,
                    size: 20.0,
                    controller: _animationController,
                  ),

                ):Text(
                  "Submit",
                  style: AppStyles.medium22(context).copyWith(
                    color: AppColors.white,
                    fontFamily: "Poppins",
                  ),
                ),
                onPressed: () => _sendImageToServer(context),
              ),
            ],
          ),
        )
        //_buildNextButton(context),
      ],
    );
  }

  Widget _buildImageMethodWidget(String method, BuildContext context) {
    switch (method) {
      case 'Picture':
        return _buildPicturesWidget(context);
      case 'Drawing':
        return _buildDrawingWidget(context);
      case 'Coloring':
        return _buildColoringWidget(context);
      case 'Hand Right':
        return _buildHandRightWidget(context);
      default:
        return Container();
    }
  }

  Widget _buildPicturesWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(
              "Upload face image",
              style: AppStyles.medium26(context).copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const CircularContainerWithImage(
            imageProvider: AssetImage('assets/images/ph_scan.png'),
          ),
          verticalSpace(context.height * 12 / 852),
          Text(
            "Tips before take a photo",
            style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
          ),
          verticalSpace(context.height * 12 / 852),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
            child: const TipsContainer(
              tips: [
                '• Capture clear facial expressions.',
                '• Photograph the child in a natural environment like home or garden.',
                '• Choose a comfortable time for the child.',
                '• Use natural lighting.',
                '• Focus on the eyes to reflect emotions.',
              ],
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
            child: CustomImageBottom(
              cameraImagePath: "assets/images/camera.png",
              galleryImagePath: "assets/images/gallery.png",
              onCameraPressed: () => _pickImage(ImageSource.camera),
              onGalleryPressed: () => _pickImage(ImageSource.gallery),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawingWidget(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Upload Drawing image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/drawing.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Ensure a quiet, distraction-free environment.',
              'Use pencils for drawing.',
              'Let the child draw freely without strict guidelines',
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
            cameraImagePath: "assets/images/camera.png",
            galleryImagePath: "assets/images/gallery.png",
            onCameraPressed: () => _pickImage(ImageSource.camera),
            onGalleryPressed: () => _pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }

  Widget _buildColoringWidget(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Upload Coloring image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/coloring.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Use simple geometric shapes.',
              'Offer a variety of colors.',
              'Ensure a comfortable, well-lit space for the child.'
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
            cameraImagePath: "assets/images/camera.png",
            galleryImagePath: "assets/images/gallery.png",
            onCameraPressed: () => _pickImage(ImageSource.camera),
            onGalleryPressed: () => _pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }

  Widget _buildHandRightWidget(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Upload hand-write image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/hand_right.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Use simple geometric shapes.',
              'Offer a variety of colors.',
              'Ensure a comfortable, well-lit space for the child.'
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
            cameraImagePath: "assets/images/camera.png",
            galleryImagePath: "assets/images/gallery.png",
            onCameraPressed: () => _pickImage(ImageSource.camera),
            onGalleryPressed: () => _pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }

  Future<void> _sendImageToServer(BuildContext context) async {
    if (_image == null) return;

    // Start loading
    setState(() {
      _isLoading = true;
    });

    try {
      // Extract file name
      String fileName = _image!.path.split('/').last;

      // Read the file as bytes and print the file size
      final fileBytes = await _image!.readAsBytes();
      log('File size: ${fileBytes.length} bytes');

      // Prepare FormData
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          _image!.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
        // Add other fields if required by the server
      });

      // Print file details and FormData
      log('Sending file: ${_image!.path}');
      log('FormData fields: ${formData.fields}');
      log('FormData files: ${formData.files}');

      // Get the API URL based on the selected method
      String? apiUrl = methodApiMap[_selectedMethod];
      log('API URL: $apiUrl');
      String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
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
          _handleNextStep(context);  // Proceed to the next step
        } else {
          log('Image upload failed with status code: ${response.statusCode}');
          setupErrorState(context, 'Status code: ${response.statusCode}');
        }
      } else {
        log('No API URL found for selected method');
        setupErrorState(context, 'No API URL found for the selected method');
      }
    } catch (e) {
      if (e is DioException) {
        log('DioException: ${e.message}');
        log('Response data: ${e.response?.data}');
        log('Response headers: ${e.response?.headers}');
        log('Response status: ${e.response?.statusCode}');
        setupErrorState(
          context,
          'Failed to upload image: ${e.response?.data}\nStatus code: ${e.response?.statusCode}',
        );
      } else {
        log('Error: $e');
        setupErrorState(context, 'An unexpected error occurred: ${e}');
      }
    } finally {
      // Stop loading
      setState(() {
        _isLoading = false;
      });
    }
  }


  void _handleNextStep(BuildContext context) {
    if (widget.currentImageStep < widget.selectedMethods.length) {
      widget.onNextStep();
    } else {
      GoRouter.of(context).go('/resultTest');
    }
  }

  void setupErrorState(BuildContext context, String error) {
    // GoRouter.of(context).pop();
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, $error',
    );
  }
}
