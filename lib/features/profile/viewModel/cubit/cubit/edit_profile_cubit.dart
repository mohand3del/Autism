import 'package:autism/core/utils/user_data_cache.dart';
import 'package:autism/features/profile/data/repo/edit_profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;

  EditProfileCubit(this._editProfileRepo)
      : super(const EditProfileState.initial());

  Future<void> updateProfile({
    required String fullName,
    required String gender,
    required String dateOfBirth,
  }) async {
    try {
      emit(const EditProfileState.loading());

      final result = await _editProfileRepo.editProfile(
        fullName: fullName,
        gender: gender,
        dateOfBirth: dateOfBirth,
      );

      result.when(
        success: (response) {
           UserDataCache.instance.updateUserData(response.data);
          emit(const EditProfileState.success());
        
        
        },
        failure: (error) =>
            emit(EditProfileState.error(error.apiErrorModel.message ?? '')),
      );
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
  }
}
