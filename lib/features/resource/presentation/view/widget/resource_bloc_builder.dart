





import 'package:autism/features/resource/presentation/view/widget/resource_list_view.dart';
import 'package:autism/features/resource/viewModel/resource_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'resource_shimmer.dart';


class ResourceBlocBuilder extends StatelessWidget {
  const ResourceBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResourceCubit, ResourceState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();  // Return the loading widget
          },
          success: (data) {
            final cubit = context.read<ResourceCubit>();
            final allData = cubit.allData ;  // Store the data in the cubit

            return ResourceListView(data: allData);  // Return the data view widget
          },
          error: (String error) {
            return setupError();  // Return the error widget
          },
          orElse: () {
            return const SizedBox.shrink();  // Return an empty widget if none of the above matches
          },
        );
      },
    );
  }

  Widget setupLoading() {

    return  ResourceShimmer();
  }

  Widget setupError() {
    return const SizedBox.shrink();  // You can customize this if you want to show an error message
  }
}
