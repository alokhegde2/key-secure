import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

Future<bool> isConnected() async {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult result = ConnectivityResult.none;
  try {
    result = await _connectivity.checkConnectivity();
  } on PlatformException catch (e) {
    print(e.toString());
  }
  if (result == ConnectivityResult.none) {
    return false;
  } else if (result == ConnectivityResult.mobile) {
    return true;
  } else if (result == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
