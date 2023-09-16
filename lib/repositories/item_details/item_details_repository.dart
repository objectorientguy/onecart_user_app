import '../../data/models/item_details/item_details_model.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsModel> getProductDetails(int prodId);
}
