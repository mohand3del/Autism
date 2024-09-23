import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/features/resource/data/repo/resource_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/recource_response_body.dart';

part 'resource_state.dart';
part 'resource_cubit.freezed.dart';

class ResourceCubit extends Cubit<ResourceState<List<FullDatum>>> {
  final ResourceRepo resourceRepo;
  int _page = 1; // Initialize the page number
  bool hasReachedMax = false; // Track if there are more resources
  List<FullDatum> allData = []; // To store all fetched data

  ResourceCubit(this.resourceRepo) : super(const ResourceState.initial());

  Future<void> fetchResources({bool isLoadMore = false}) async {
    if (state is Loading || hasReachedMax) return;

    if (isLoadMore) {
      _page++;
    } else {
      _page = 1; // Reset the page when not loading more
    }

    emit(const ResourceState.loading());

    final ApiResult<ResourceResponseBody> result =
    await resourceRepo.getResource(page: _page);

    result.when(
      success: (data) {
        if (data.fullData.isEmpty) {
          hasReachedMax = true;
        } else {
          if (isLoadMore) {
            allData.addAll(data.fullData);
          } else {
            allData = data.fullData;
          }

          emit(ResourceState.success(allData));
        }
      },
      failure: (error) {
        emit(ResourceState.error(message: ErrorHandler.handle(error).toString()));
      },
    );
  }
}
