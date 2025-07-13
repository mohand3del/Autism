import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/cubit/internet_connection_cubit.dart';
import 'package:autism/core/cubit/internet_connection_state.dart';
import 'package:autism/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected) {
              return const HomeViewBody();
            } else if (state is InternetDisconnected) {
              return Center(
                child: Lottie.asset('assets/images/wifi.json'),
              );
            } else if (state is InternetNoAccess) {
              return Center(
                child: LottieBuilder.asset('assets/images/mobile-signal.json'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
