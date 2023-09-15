import 'package:onecart_user_app/repositories/view_cart/view_cart_repository.dart';

import '../../data/models/view_cart/view_cart_model.dart';

class ViewCartRepositoryImpl implements ViewCartRepository {
  @override
  Future<ViewCartModel> getAllCartItems() async {
    final response = {
      "status": 200,
      "message": "Cart items fetched",
      "data": [
        {
          "cartItemId": 1,
          "product": {
            "brand_id": 2,
            "product_id": 1,
            "product_name": "Parachute Coconut Oil",
            "details": "Premium Coconut Oil"
          },
          "variant": {
            "count": 100,
            "brand_name": "Parachute",
            "discount": 22,
            "description":
                "Tired of dull and frizzy hair? Hair oil plays a vital role in protecting your hair from regular wear and tear. Parachute 100% Pure Coconut Hair Oil gives your hair the much-needed nourishment and protects it from further damage.",
            "ratings": 4,
            "variant_cost": 127.0,
            "variant_id": 13,
            "discounted_cost": 99.0,
            "quantity": "1 bottle",
            "image": ["https://oneart.onrender.com/images/parachute-300ml.jpg"],
            "product_id": 1
          }
        },
        {
          "cartItemId": 2,
          "product": {
            "brand_id": 2,
            "product_id": 1,
            "product_name": "Parachute Coconut Oil",
            "details": "Premium Coconut Oil"
          },
          "variant": {
            "count": 100,
            "brand_name": "Parachute",
            "discount": 8,
            "description":
                "Tired of dull and frizzy hair? Hair oil plays a vital role in protecting your hair from regular wear and tear. Parachute 100% Pure Coconut Hair Oil gives your hair the much-needed nourishment and protects it from further damage.",
            "ratings": 4,
            "variant_cost": 37.0,
            "variant_id": 14,
            "discounted_cost": 34.0,
            "quantity": "1 bottle",
            "image": [
              "https://oneart.onrender.com/images/parachute-100-ml.jpg"
            ],
            "product_id": 1
          }
        },
        {
          "cartItemId": 3,
          "product": {
            "brand_id": 2,
            "product_id": 1,
            "product_name": "Parachute Coconut Oil",
            "details": "Premium Coconut Oil"
          },
          "variant": {
            "count": 800,
            "brand_name": "Parachute",
            "discount": 22,
            "description":
                "Tired of dull and frizzy hair? Hair oil plays a vital role in protecting your hair from regular wear and tear. Parachute 100% Pure Coconut Hair Oil gives your hair the much-needed nourishment and protects it from further damage.",
            "ratings": 0,
            "variant_cost": 99.0,
            "variant_id": 15,
            "discounted_cost": 99.0,
            "quantity": "200 ml",
            "image": [
              "https://oneart.onrender.com/images/parachute-product.jpg",
              "https://oneart.onrender.com/images/parachute-200-ml.jpg"
            ],
            "product_id": 1
          }
        }
      ]
    };

    return ViewCartModel.fromJson(response);
  }
}
