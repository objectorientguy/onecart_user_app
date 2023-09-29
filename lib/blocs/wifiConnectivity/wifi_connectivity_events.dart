abstract class WifiConnectivityEvent {}

class ObserveNetwork extends WifiConnectivityEvent {}

class NotifyNetworkStatus extends WifiConnectivityEvent {
  final bool isConnected;

  NotifyNetworkStatus({this.isConnected = false});
}
