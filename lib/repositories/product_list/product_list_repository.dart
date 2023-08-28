import '../../data/models/get_product/get_product_model.dart';

abstract class ProductsRepository {
  Future<GetProductByIdModel> fetchProducts(int categoryId);
}
