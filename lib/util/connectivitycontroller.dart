import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _checkConnection();
    _connectivity.onConnectivityChanged.listen((result) {
      isConnected.value = (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi);
    });
  }

  Future<void> _checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    isConnected.value = (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi);
    return _checkConnection();
  }
}
