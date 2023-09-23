import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_module/app_module.dart';
import '../../data/models/orders/get_all_orders_model.dart';
import '../../data/models/orders/order_details_model.dart';
import '../../repositories/orders/orders_repository.dart';
import 'orders_events.dart';
import 'orders_states.dart';

class GetAllOrdersBloc extends Bloc<OrdersEvent, OrdersStates> {
  final OrdersRepository _ordersRepository = getIt<OrdersRepository>();

  OrdersStates get initialState => GetAllOrdersInitial();

  GetAllOrdersBloc() : super(GetAllOrdersInitial()) {
    on<GetAllOrders>(_getAllOrders);
    on<GetAllOrderDetails>(_getAllOrderDetails);

  }

  FutureOr<void> _getAllOrders(
      GetAllOrders event, Emitter<OrdersStates> emit) async {
    emit(GetAllOrdersLoading());
    // try {
      GetAllOrdersListModel getAllOrdersListModel =
          await _ordersRepository.getAllOrders();
      log(getAllOrdersListModel.data.toString());
      emit(GetAllOrdersLoaded(getAllOrdersListModel: getAllOrdersListModel));
    // } catch (e) {
    //   emit(GetAllOrdersError(message: e.toString()));
    // }
  }
  FutureOr<void> _getAllOrderDetails(
      GetAllOrderDetails event, Emitter<OrdersStates> emit) async {
    emit(GetAllOrdersDetailsLoading());
    // try {
      OrderDetailsModel getOrdersDetailsModel =
      await _ordersRepository.getOrdersDetails();
      log(getOrdersDetailsModel.data.toString());
      emit(GetAllOrdersDetailsLoaded(getOrdersDetailsModel: getOrdersDetailsModel));
    // } catch (e) {
    //   emit(GetAllOrdersDetailsError(message: e.toString()));
    // }
  }


}
