import '/core/app_export.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<List<ConnectivityResult>> get connectivityResult;

  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity) {
    connectivity = connectivity;
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (result.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (result.contains(ConnectivityResult.vpn)) {
      return true;
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      return true;
    } else if (result.contains(ConnectivityResult.other)) {
      return true;
    } else if (result.contains(ConnectivityResult.none)) {
      return false;
    }
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
