// import 'dart:developer';
// import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'profile_header.dart';

// class ProfileHeaderWidget extends StatelessWidget {
//   const ProfileHeaderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UploadImageCubit, UploadImageState>(
//       builder: (context, state) {
//         return ProfileHeader(
//           oldImage: context.read<UploadImageCubit>().state.maybeWhen(
//                 success: (image) => image?.path ?? '',
//                 orElse: () => '',
//               ),
//           showCameraIcon: true,
//           onCameraTap: () {
//             log('Camera icon tapped');
//             context.read<UploadImageCubit>().uploadImage();
//             log(context.read<UploadImageCubit>().uploadImage().toString());
//           },
//         );
//       },
//     );
//   }
// }
