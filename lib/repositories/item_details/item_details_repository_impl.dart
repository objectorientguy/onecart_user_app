import '../../data/models/item_details/item_details_model.dart';
import '../../utils/dio_client.dart';
import 'item_details_repository.dart';

class ItemDetailsRepositoryImpl implements ItemDetailsRepository {
  @override
  Future<ItemDetailsModel> getItemDetails() async {
    final response =
        await DioClient().get("https://oneart.onrender.com/products/1");
    return ItemDetailsModel.fromJson(response);
  }
}
