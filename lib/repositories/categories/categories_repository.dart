import '../../data/models/categories/get_all_categories_model.dart';

abstract class CategoriesRepository {
  Future<GetAllCategoriesListModel> getAllCategories();
}
