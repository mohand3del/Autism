import 'package:autism/core/constant/app_colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/routing/router.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await setupGetIt();
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
    return MaterialApp.router(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,

      ),

      routerConfig: AppRouter.router,


      builder: DevicePreview.appBuilder,

    );
  }
}
