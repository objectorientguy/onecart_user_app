abstract class AddToCartEvents {}

class FetchCartItems extends AddToCartEvents {
  final Map cartDetails;
  final int cartId;

  FetchCartItems({required this.cartDetails, required this.cartId});

}
