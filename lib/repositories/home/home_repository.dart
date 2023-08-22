import '../../data/models/home/home_model.dart';

abstract class HomeRepository {
  Future<HomeModel> getHomeDetails();
}
