import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/repo/video_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_by_id_state.dart';
part 'video_by_id_cubit.freezed.dart';

class VideoByIdCubit extends Cubit<VideoByIdState> {
  final VideoRepo _videoRepo;
  VideoByIdCubit(this._videoRepo) : super(const VideoByIdState.initial());


  Future<void> getVideoById({String? videoId}) async {
    emit(const VideoByIdState.loading());
    final response = await _videoRepo.getVideoById(videoId: videoId);
    response.when(
      success: (data) {
        emit(VideoByIdState.success(data));
      },
      failure: (error) {
        emit(VideoByIdState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
