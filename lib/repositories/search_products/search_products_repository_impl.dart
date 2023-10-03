import 'package:onecart_user_app/repositories/search_products/search_products_repository.dart';

import '../../data/models/search_product/search_product_model.dart';
import '../../utils/dio_client.dart';

class SearchProductsRepositoryImpl extends SearchProductsRepository {
  @override
  Future<SearchProductModel> fetchSearchProducts(searchParam) async {
    final response = await DioClient().get(
        "https://oneart.onrender.com/productsSearch/9898989898?search_term=$searchParam");
    return SearchProductModel.fromJson(response);
  }
}
