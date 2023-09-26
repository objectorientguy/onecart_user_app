abstract class RatingsEvent {}

class GetAllRatings extends RatingsEvent {}

class AddRatings extends RatingsEvent {
  final int rating;
  final Map reviewTextMap;

  AddRatings({
    required this.rating,
    required this.reviewTextMap,
  });
}
