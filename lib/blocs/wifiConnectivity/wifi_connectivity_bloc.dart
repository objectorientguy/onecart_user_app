import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onecart_user_app/blocs/wifiConnectivity/wifi_connectivity_events.dart';
import 'package:onecart_user_app/blocs/wifiConnectivity/wifi_connectivity_states.dart';

import '../../utils/connectivity_util.dart';

class WifiConnectivityBloc
    extends Bloc<WifiConnectivityEvent, WifiConnectivityState> {
  WifiConnectivityBloc._() : super(EstablishingNetwork()) {
    on<ObserveNetwork>(_observeNetwork);
    on<NotifyNetworkStatus>(_notifyNetworkStatus);
  }

  static final WifiConnectivityBloc _instance = WifiConnectivityBloc._();

  factory WifiConnectivityBloc() => _instance;

  void _observeNetwork(
      ObserveNetwork event, Emitter<WifiConnectivityState> emit) {
    ConnectivityUtil.observeNetwork();
  }

  void _notifyNetworkStatus(
      NotifyNetworkStatus event, Emitter<WifiConnectivityState> emit) {
    event.isConnected ? emit(EstablishedNetwork()) : emit(NoNetwork());
  }
}
