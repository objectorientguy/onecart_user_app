abstract class RatingsEvent {}

class GetAllRatings extends RatingsEvent {
  final int productId;
  GetAllRatings({required this.productId});
}

class AddRatings extends RatingsEvent {
  final Map reviewMap;

  AddRatings({
    required this.reviewMap,
  });
}
