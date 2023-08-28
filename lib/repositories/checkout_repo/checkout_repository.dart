import '../../data/models/checkout_model/checkout_model.dart';

abstract class CheckoutRepository {
  Future<FetchCheckoutModel> fetchCheckout();
}
