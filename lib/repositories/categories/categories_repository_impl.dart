import '../../data/models/categories/get_all_categories_model.dart';
import '../../utils/dio_client.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<GetAllCategoriesListModel> getAllCategories() async {
    final response =
        await DioClient().get("https://oneart.onrender.com/getCategories");
    return GetAllCategoriesListModel.fromJson(response);
  }
}
