import '../../data/models/search_product/search_product_model.dart';

abstract class SearchProductsRepository {
  Future<SearchProductModel> fetchSearchProducts(searchParam);
}
