import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_module/app_module.dart';
import '../../data/models/orders/order_details_model.dart';
import '../../repositories/order_details_repo/oder_details_repository.dart';
import 'order_detail_states.dart';
import 'order_details_event.dart';

class GetAllOrderDetailsBloc extends Bloc<GetAllOrderDetails, OrdersDetailsStates> {
  final OrdersDetailsRepository _orderDetailsRepository = getIt<OrdersDetailsRepository>();

  OrdersDetailsStates get initialState => GetAllOrdersDetailsInitial();

  GetAllOrderDetailsBloc() : super(GetAllOrdersDetailsInitial()) {
    on<GetAllOrderDetails>(_getAllOrderDetails);
  }

  FutureOr<void> _getAllOrderDetails(
      GetAllOrderDetails event, Emitter<OrdersDetailsStates> emit) async {
    emit(GetAllOrdersDetailsLoading());
    try {
      OrderDetailsModel getOrdersDetailsModel =
      await _orderDetailsRepository.getOrdersDetails();
      log(getOrdersDetailsModel.data.toString());
      emit(GetAllOrdersDetailsLoaded(getOrdersDetailsModel: getOrdersDetailsModel));
    } catch (e) {
      emit(GetAllOrdersDetailsError(message: e.toString()));
    }
  }
}
