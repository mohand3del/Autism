abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final String connectionType;
  InternetConnected(this.connectionType);
}

class InternetDisconnected extends InternetState {}
class InternetNoAccess extends InternetState {
  final String connectionType;
  InternetNoAccess(this.connectionType);
}
