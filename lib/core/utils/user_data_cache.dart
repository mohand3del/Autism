import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';

class UserDataCache {
  static UserDataCache? _instance;
  static ProfileUserDataResponse? _userData;

  UserDataCache._();

  static UserDataCache get instance {
    _instance ??= UserDataCache._();
    return _instance!;
  }

  void updateUserData(ProfileUserDataResponse userData) {
    _userData = userData;
  }

  ProfileUserDataResponse? get userData => _userData;

  String get userImage => _userData?.user.image ?? '';
  String get userName => _userData?.user.name ?? '';
  String get userEmail => _userData?.user.email ?? '';
}
