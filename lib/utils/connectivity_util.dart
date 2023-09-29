import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:onecart_user_app/blocs/wifiConnectivity/wifi_connectivity_bloc.dart';

import '../blocs/wifiConnectivity/wifi_connectivity_events.dart';

class ConnectivityUtil {
  static void observeNetwork() {
    Connectivity().checkConnectivity().then((ConnectivityResult value) =>
        WifiConnectivityBloc().add(NotifyNetworkStatus(
            isConnected: value == ConnectivityResult.none ? false : true)));
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        WifiConnectivityBloc().add(NotifyNetworkStatus());
      } else {
        WifiConnectivityBloc().add(NotifyNetworkStatus(isConnected: true));
      }
    });
  }
}
