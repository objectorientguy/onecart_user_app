abstract class ItemDetails {}

class FetchItemDetails extends ItemDetails {
  final int itemId;

  FetchItemDetails(this.itemId);
}
