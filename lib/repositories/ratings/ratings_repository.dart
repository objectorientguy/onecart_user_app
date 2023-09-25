import '../../data/models/ratings_model/view_ratings_model.dart';

abstract class ViewRatingsRepository {
  Future<ViewRatingsModel> getAllRatings();
}
