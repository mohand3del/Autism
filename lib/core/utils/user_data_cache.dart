import 'dart:async';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';

class UserDataCache {
  static UserDataCache? _instance;
  static ProfileUserDataResponse? _userData;
  final _controller = StreamController<ProfileUserDataResponse?>.broadcast();

  UserDataCache._();

  static UserDataCache get instance {
    _instance ??= UserDataCache._();
    return _instance!;
  }

  Stream<ProfileUserDataResponse?> get userDataStream => _controller.stream;

  void updateUserData(ProfileUserDataResponse userData) {
    _clearCache(); // Clear old data before updating
    _userData = userData;
    _controller.add(_userData);
  }

  ProfileUserDataResponse? get userData => _userData;

  void _clearCache() {
    _userData = null; // Reset old cached data
  }

  void dispose() {
    _controller.close();
  }
}
