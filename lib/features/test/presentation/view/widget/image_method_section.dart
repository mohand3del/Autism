import 'dart:io';

import 'package:autism/features/test/data/services/image_upload_service.dart';
import 'package:autism/features/test/presentation/view/widget/coloring_method_widget.dart';
import 'package:autism/features/test/presentation/view/widget/drawing_method_widget.dart';
import 'package:autism/features/test/presentation/view/widget/hand_write_method_widget.dart';
import 'package:autism/features/test/presentation/view/widget/method_progress_indicator.dart';
import 'package:autism/features/test/presentation/view/widget/picture_method_widget.dart';
import 'package:autism/features/test/presentation/view/widget/selected_image_preview.dart';
import 'package:flutter/material.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

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
  late AnimationController _animationController;
  late ImageUploadService _imageUploadService;
  bool _isLoading = false;
  late String _selectedMethod;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _selectedMethod = widget.selectedMethods[widget.currentImageStep - 1];
    _imageUploadService = ImageUploadService();
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
        MethodProgressIndicator(
          totalSteps: imageMethods.length,
          currentStep: imageMethodIndex + 1,
        ),
        verticalSpace(context.height * 20 / 852),
        Expanded(
          child: _image == null && imageMethodIndex < imageMethods.length
              ? _buildMethodWidget(imageMethods[imageMethodIndex])
              : SelectedImagePreview(
                  imageFile: _image!,
                  isLoading: _isLoading,
                  onSubmitPressed: () => _sendImageToServer(context),
                  animationController: _animationController,
                  isLastStep: widget.currentImageStep >= imageMethods.length,
                ),
        )
      ],
    );
  }

  Widget _buildMethodWidget(String method) {
    switch (method) {
      case 'Picture':
        return PictureMethodWidget(onImagePicked: _pickImage);
      case 'Drawing':
        return DrawingMethodWidget(onImagePicked: _pickImage);
      case 'Coloring':
        return ColoringMethodWidget(onImagePicked: _pickImage);
      case 'Hand write':
        return HandWriteMethodWidget(onImagePicked: _pickImage);
      default:
        return Container();
    }
  }

  Future<void> _sendImageToServer(BuildContext context) async {
    if (_image == null) return;

    // Start loading
    setState(() {
      _isLoading = true;
    });

    try {
      // Get the method count to determine behavior
      final imageMethods =
          widget.selectedMethods.where((method) => method != 'Form').toList();
      final isLastMethod = widget.currentImageStep >= imageMethods.length;

      // If this is not the last method and we have multiple methods, just move to next step
      if (!isLastMethod && imageMethods.length > 1) {
        setState(() {
          _isLoading = false;
          _image = null; // Reset image for next step
        });
        widget.onNextStep();
        return;
      }

      // Send the image to the server
      bool success = await _imageUploadService.uploadImage(
        _image!,
        _selectedMethod,
        context,
      );

      if (success) {
        _handleNextStep(context);
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
}
