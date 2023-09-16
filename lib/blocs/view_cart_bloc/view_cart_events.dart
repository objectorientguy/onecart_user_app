abstract class ViewCartEvent {}

class GetAllCartItems extends ViewCartEvent {
  final int cartItemId;

  GetAllCartItems(this.cartItemId);
}
