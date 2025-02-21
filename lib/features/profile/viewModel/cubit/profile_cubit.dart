import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/data/repo/profile_repo.dart';
import 'package:autism/core/utils/user_data_cache.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial()) {
    getProfileData();
  }

  Future<void> getProfileData() async {
    emit(const ProfileState.loading());
    
    // Check cache first
    final cachedData = UserDataCache.instance.userData;
    if (cachedData != null) {
      emit(ProfileState.loaded(cachedData));
    }

    try {
      final result = await _profileRepo.getUserData();
      result.when(
        success: (data) {
          UserDataCache.instance.updateUserData(data);
          emit(ProfileState.loaded(data));
        },
        failure: (error) => emit(ProfileState.error(error.apiErrorModel.message ?? '')),
      );
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  void refreshProfile() {
    final cachedData = UserDataCache.instance.userData;
    if (cachedData != null) {
      emit(ProfileState.loaded(cachedData));
    }
  }
}


