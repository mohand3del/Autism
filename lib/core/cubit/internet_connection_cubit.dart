import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_connection_state.dart';


class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetCubit() : super(InternetLoading()) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    _checkConnection();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      await _checkInternetAccess("Wi-Fi");
    } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
      await _checkInternetAccess("Mobile Data");
    } else {
      emit(InternetDisconnected());
    }
  }

  Future<void> _checkInternetAccess(String connectionType) async {
    try {
      final result = await InternetAddress.lookup('8.8.8.8')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(InternetConnected(connectionType));
      } else {
        emit(InternetNoAccess(connectionType));
      }
    } on SocketException catch (_) {
      emit(InternetNoAccess(connectionType));
    } on TimeoutException catch (_) {
      emit(InternetNoAccess(connectionType));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
