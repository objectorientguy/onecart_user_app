import '../../data/models/item_details/item_details_model.dart';

abstract class ItemDetailsRepository{
  Future<ItemDetailsModel> getItemDetails();

}