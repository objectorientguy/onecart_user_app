import '../../data/models/ratings_model/view_ratings_model.dart';

abstract class RatingsStates {}

class GetAllRatingsInitial extends RatingsStates {}

class GetAllRatingsLoading extends RatingsStates {}

class GetAllRatingsLoaded extends RatingsStates {
  final ViewRatingsModel viewRatingsModel;

  GetAllRatingsLoaded({required this.viewRatingsModel});
}

class GetAllRatingsError extends RatingsStates {
  final String message;

  GetAllRatingsError({required this.message});
}
