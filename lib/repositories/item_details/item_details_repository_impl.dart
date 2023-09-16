import '../../data/models/item_details/item_details_model.dart';
import '../../utils/dio_client.dart';
import 'item_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  @override
  Future<ProductDetailsModel> getProductDetails(int prodId) async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getProductVariants/$prodId");

    return ProductDetailsModel.fromJson(response);
  }
}
