import 'dart:async';
import '../../data/models/checkout_model/checkout_model.dart';
import '../../utils/dio_client.dart';
import 'checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  @override
  Future<FetchCheckoutModel> fetchCheckout() async {
    final response =
        await DioClient().get("https://oneart.onrender.com/checkoutScreen/1");
    return FetchCheckoutModel.fromJson(response);
  }
}
