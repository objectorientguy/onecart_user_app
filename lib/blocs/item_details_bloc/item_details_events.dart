import '../../data/models/item_details/item_details_model.dart';

abstract class ItemDetails {}

class FetchItemDetails extends ItemDetails {
  final int itemId;
  final int variantId;

  FetchItemDetails(this.itemId, this.variantId);
}

class ChangeVariantIndex extends ItemDetails {
  final int variantIndex;
  final ProductDetailsModel productDetailsModel;

  ChangeVariantIndex(
      {required this.variantIndex, required this.productDetailsModel});
}
