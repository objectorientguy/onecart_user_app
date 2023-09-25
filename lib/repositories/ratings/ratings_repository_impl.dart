import 'package:onecart_user_app/repositories/ratings/ratings_repository.dart';

import '../../data/models/ratings_model/view_ratings_model.dart';
import '../../utils/dio_client.dart';

class ViewRatingsRepositoryImpl implements ViewRatingsRepository {
  @override
  Future<ViewRatingsModel> getAllRatings() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getReview?product_id=3");
    return ViewRatingsModel.fromJson(response);
  }
}
