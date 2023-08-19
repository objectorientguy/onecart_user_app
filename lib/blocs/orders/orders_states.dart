import '../../data/models/orders/get_all_orders_model.dart';

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
