import 'package:onecart_user_app/repositories/product_list/product_list_repository.dart';

import '../../data/models/get_product/get_product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<GetProductByIdModel> fetchProducts(categoryId) async {
    final response = {
      "status": 200,
      "message": "Products by category fetched",
      "products": [
        {
          "product_id": 85,
          "product_name": "Parle-G Gold Biscuits 1 kg",
          "details": "Made from the finest quality ingredients",
          "variants": [
            {
              "variant_id": 24,
              "variant_cost": 30.0,
              "count": 100,
              "brand_name": "Parle",
              "discounted_cost": 27.0,
              "discount": 10,
              "quantity": "200 gms",
              "description": "Filled with the goodness of milk and wheat, Parle-G has been a source of all-round nourishment for the nation since decades. They're crispy, they're tasty and they'll leave you craving for more.",
              "image": [
                "https://oneart.onrender.com/images/parle-g-gold-biscuits-200-g.jpg"
              ],
              "ratings": 4
            },
            {
              "variant_id": 25,
              "variant_cost": 75.0,
              "count": 100,
              "brand_name": "Parle",
              "discounted_cost": 69.0,
              "discount": 8,
              "quantity": "500 gms",
              "description": "Filled with the goodness of milk and wheat, Parle-G has been a source of all-round nourishment for the nation since decades. They're crispy, they're tasty and they'll leave you craving for more.",
              "image": [
                "https://oneart.xonrender.com/images/parle-g-gold-biscuits-500-g-prod.jpg"
              ],
              "ratings": 4
            },
            {
              "variant_id": 26,
              "variant_cost": 10.0,
              "count": 100,
              "brand_name": "Parle",
              "discounted_cost": 0.0,
              "discount": 0,
              "quantity": "60 gms",
              "description": "Filled with the goodness of milk and wheat, Parle-G has been a source of all-round nourishment for the nation since decades. They're crispy, they're tasty and they'll leave you craving for more.",
              "image": [
                "https://oneart.onrender.com/images/parle-g-gold-biscuits-60-g-produ.jpg"
              ],
              "ratings": 4
            }
          ]
        },
        {
          "product_id": 86,
          "product_name": "Maggi 2-Minute Masala Noodles 70 g",
          "details": "Made from the finest quality ingredients",
          "variants": [
            {
              "variant_id": 27,
              "variant_cost": 160.0,
              "count": 100,
              "brand_name": "Maggie",
              "discounted_cost": 128.0,
              "discount": 20,
              "quantity": "832 gms",
              "description": "Maggi 2-Minutes Noodles have been a classic Indian snack for a good few decades now. Nestle brings you another delicious instant food product - Maggi 2-Minute Masala Noodles!",
              "image": [
                "https://oneart.onrender.com/images/maggi-2-minutes-masala-noodles.jpg"
              ],
              "ratings": 4
            },
            {
              "variant_id": 28,
              "variant_cost": 28.0,
              "count": 100,
              "brand_name": "Maggie",
              "discounted_cost": 268.0,
              "discount": 7,
              "quantity": "140 gms",
              "description": "Maggi 2-Minutes Noodles have been a classic Indian snack for a good few decades now. Nestle brings you another delicious instant food product - Maggi 2-Minute Masala Noodles!",
              "image": [
                "https://oneart.onrender.com/images/maggi-2-minute-masala-noodles-14.jpg"
              ],
              "ratings": 4
            }
          ]
        }
      ]
    };
    return GetProductByIdModel.fromJson(response);
  }
}
