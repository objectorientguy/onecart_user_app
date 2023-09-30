import '../../data/models/home/home_model.dart';
import '../../utils/dio_client.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeModel> getHomeDetails() async {
    final response = await DioClient().get(
        "https://oneart.onrender.com/homescreen?customer_contact=9898989898");
    return HomeModel.fromJson(response);
  }
}
