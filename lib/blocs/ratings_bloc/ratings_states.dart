import '../../data/models/ratings_model/add_ratings_model.dart';
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

class AddRatingsLoading extends RatingsStates {}

class AddRatingsLoaded extends RatingsStates {
  final AddRatingsModel addRatingsModel;
  final Map reviewTextMap;

  AddRatingsLoaded(
      {required this.reviewTextMap, required this.addRatingsModel});
}

class AddRatingsError extends RatingsStates {
  final String message;

  AddRatingsError({required this.message});
}
