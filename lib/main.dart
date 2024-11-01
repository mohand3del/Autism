import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/helper/contants.dart';
import 'core/routing/router.dart';
import 'features/resource/viewModel/resource_cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await setupGetIt();
 await checkIfLoggedInUser();
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (_) => const Autism()),

  );
}

class Autism extends StatelessWidget {
  const Autism({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[

      BlocProvider(create: (context) => TellAboutCubit(getIt()),),
    BlocProvider(
    create: (BuildContext context) => getIt<ResourceCubit>()..fetchResources(),),



    ],

      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,
        
        title: 'Autism',

        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,

        ),

        routerConfig: AppRouter.router,


        builder: DevicePreview.appBuilder,

      ),
    );
  }
}

checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
