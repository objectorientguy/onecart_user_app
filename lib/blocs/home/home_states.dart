import '../../data/models/home/home_model.dart';

abstract class HomeStates {}

class GetHomeDetailsInitial extends HomeStates {}

class GetHomeDetailsLoading extends HomeStates {}

class GetHomeDetailsLoaded extends HomeStates {
  final HomeModel homeModel;

  GetHomeDetailsLoaded({required this.homeModel});
}

class GetHomeDetailsError extends HomeStates {
  final String message;

  GetHomeDetailsError({required this.message});
}
