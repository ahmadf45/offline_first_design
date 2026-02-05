import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:offline_first_design/core/network/network_info_interface.dart';

class NetworkInfo implements NetworkInfoInterface {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final results = await connectivity.checkConnectivity();
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }
}
