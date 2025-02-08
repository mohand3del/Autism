import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());
  final ProfileRepo _profileRepo;

  void getProfileData() async {
    emit(const ProfileState.loading());
    final response = await _profileRepo.getUserData();
    response.when(success: (profileUserDataResponse) {
      emit(ProfileState.loaded(profileUserDataResponse));
    }, failure: (error) {
      emit(ProfileState.error(error.apiErrorModel.message.toString()));
    });
  }
  
}
