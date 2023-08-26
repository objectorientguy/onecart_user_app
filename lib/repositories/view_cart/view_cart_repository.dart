import '../../data/models/view_cart/view_cart_model.dart';

abstract class ViewCartRepository {
  Future<ViewCartModel> getAllCartItems();
}
