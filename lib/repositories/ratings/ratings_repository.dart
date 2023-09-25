import '../../data/models/ratings_model/add_ratings_model.dart';
import '../../data/models/ratings_model/view_ratings_model.dart';

abstract class ViewRatingsRepository {
  Future<ViewRatingsModel> getAllRatings();

  Future<AddRatingsModel> addRatings(Map ratingsDetails);
}
