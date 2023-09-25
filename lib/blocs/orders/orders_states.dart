import '../../data/models/orders/get_all_orders_model.dart';
import '../../data/models/orders/order_details_model.dart';

abstract class OrdersStates {}

class GetAllOrdersInitial extends OrdersStates {}

class GetAllOrdersLoading extends OrdersStates {}

class GetAllOrdersLoaded extends OrdersStates {
  final GetAllOrdersListModel getAllOrdersListModel;

  GetAllOrdersLoaded({required this.getAllOrdersListModel});
}

class GetAllOrdersError extends OrdersStates {
  final String message;

  GetAllOrdersError({required this.message});
}

class GetAllOrdersDetailsInitial extends OrdersStates {}

class GetAllOrdersDetailsLoading extends OrdersStates {}

class GetAllOrdersDetailsLoaded extends OrdersStates {
  final OrderProductsModel getOrdersDetailsModel;

  GetAllOrdersDetailsLoaded({required this.getOrdersDetailsModel});
}

class GetAllOrdersDetailsError extends OrdersStates {
  final String message;

  GetAllOrdersDetailsError({required this.message});
}
