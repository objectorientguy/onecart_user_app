import '../../data/models/orders/get_all_orders_model.dart';
import '../../data/models/orders/order_details_model.dart';
import '../../utils/dio_client.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<GetAllOrdersListModel> getAllOrders() async {
    final response = await DioClient().get(
        "https://oneart.onrender.com/orderlist?customer_contact=9898989898");
    return GetAllOrdersListModel.fromJson(response);
  }

  @override
  Future<OrderProductsModel> getOrdersDetails() async {
    return OrderProductsModel.fromJson({
      "status": 200,
      "message": "Tracking Stage fetched",
      "data": {
        "tracking_data": {
          "ordered": "2023-09-21T18:14:40.872882+00:00",
          "track_id": 1,
          "booking_id": 1,
          "under_process": "2023-09-21T18:14:40.872882+00:00",
          "shipped": "2023-09-21T18:14:40.872882+00:00",
          "delivered": "2023-09-21T18:14:40.872882+00:00"
        },
        "order": {
          "order_id": 1,
          "user_contact": 9898989898,
          "address_id": null,
          "image_status": "https://oneart.onrender.com/images/order_placed.png",
          "order_date": "2023-09-15",
          "order_amount": 290.0,
          "invoice_number": "1695319792-bd3a3a8d-95f0-487a-a1c7-bedfcf3a3da7",
          "products": [
            {
              "product_id": 1,
              "product_name": "Parachute Coconut Oil",
              "details": "Premium Coconut Oil",
              "variants": {
                "variant_id": 13,
                "variant_cost": 127.0,
                "count": 100,
                "brand_name": "Parachute",
                "discounted_cost": 99.0,
                "discount": 22,
                "quantity": "1 bottle",
                "description":
                    "Tired of dull and frizzy hair? Hair oil plays a vital role in protecting your hair from regular wear and tear. Parachute 100% Pure Coconut Hair Oil gives your hair the much-needed nourishment and protects it from further damage.",
                "image": [
                  "https://oneart.onrender.com/images/parachute-300ml.jpg"
                ],
                "ratings": 4
              }
            }
          ],
          "cart_id": 1,
          "user_name": "sakshi",
          "order_status": "delivered",
          "order_number": "bd3a3a8d-95f0-487a-a1c7-bedfcf3a3da7",
          "product_total": 190.0,
          "delivery_fees": 40.0,
          "invoice_amount": 220.0
        },
        "products_list": [
          {
            "product_id": 1,
            "product_name": "Parachute Coconut Oil",
            "details": "Premium Coconut Oil",
            "variants": {
              "variant_id": 13,
              "variant_cost": 127.0,
              "count": 100,
              "brand_name": "Parachute",
              "discounted_cost": 99.0,
              "discount": 22,
              "quantity": "1 bottle",
              "description":
                  "Tired of dull and frizzy hair? Hair oil plays a vital role in protecting your hair from regular wear and tear. Parachute 100% Pure Coconut Hair Oil gives your hair the much-needed nourishment and protects it from further damage.",
              "image": [
                "https://oneart.onrender.com/images/parachute-300ml.jpg"
              ],
              "ratings": 4
            }
          }
        ]
      }
    });
  }
}
