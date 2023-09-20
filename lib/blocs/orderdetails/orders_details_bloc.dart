import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_module/app_module.dart';
import '../../data/models/orders/order_details_model.dart';
import '../../repositories/orders/orderdetailsrepo/orderdetails_repo.dart';
import 'order_details_states.dart';
import 'orders_details_event.dart';

class GetAllOrdersDetailsBloc extends Bloc<GetAllOrdersDetails, OrdersDetailsStates> {
  final OrdersDetailsRepository _ordersDetailsRepository = getIt<OrdersDetailsRepository>();

  OrdersDetailsStates get initialState => GetAllOrdersDetailsInitial();

  GetAllOrdersDetailsBloc() : super(GetAllOrdersDetailsInitial()) {
    on<GetAllOrdersDetails>(_getAllOrdersDetails);
  }

  FutureOr<void> _getAllOrdersDetails(
      GetAllOrdersDetails event, Emitter<OrdersDetailsStates> emit) async {
    emit(GetAllOrdersDetailsLoading());
    try {
      GetOrdersDetailsModel getOrdersDetailsModel =
      await _ordersDetailsRepository.getAllOrdersDetails();
      log(getOrdersDetailsModel.data.toString());
      emit(GetAllOrdersDetailsLoaded(getOrdersDetailsModel: getOrdersDetailsModel));
    } catch (e) {
      emit(GetAllOrdersDetailsError(message: e.toString()));
    }
  }
}
