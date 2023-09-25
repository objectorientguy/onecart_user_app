abstract class RatingsEvent {}

class GetAllRatings extends RatingsEvent {}

class AddRatings extends RatingsEvent {
  final int rating;
  final String reviewText;

  AddRatings({
    required this.rating,
    required this.reviewText,
  });
}
