import 'package:onecart_user_app/repositories/product_list/product_list_repository.dart';

import '../../data/models/get_product/get_product_model.dart';
import '../../utils/dio_client.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<GetProductByIdModel> fetchProducts() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/products/categories/101");
    return GetProductByIdModel.fromJson(response);
  }
}
