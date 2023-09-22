import '../../data/models/orders/order_details_model.dart';

abstract class OrdersDetailsStates {}

class GetAllOrdersDetailsInitial extends OrdersDetailsStates {}

class GetAllOrdersDetailsLoading extends OrdersDetailsStates {}

class GetAllOrdersDetailsLoaded extends OrdersDetailsStates {
  final OrderDetailsModel getOrdersDetailsModel;

  GetAllOrdersDetailsLoaded({required this.getOrdersDetailsModel});
}

class GetAllOrdersDetailsError extends OrdersDetailsStates {
  final String message;

  GetAllOrdersDetailsError({required this.message});
}
