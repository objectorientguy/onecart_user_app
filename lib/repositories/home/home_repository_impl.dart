import '../../data/models/home/home_model.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeModel> getHomeDetails() async {
    final response = {
      "status": 200,
      "message": "Categories, banners, and deals fetched",
      "data": {
        "categories": [
          {
            "category_name": "Snacks",
            "category_id": 1,
            "category_image": "https://oneart.onrender.com/images/snack.JPG"
          },
          {
            "category_name": "Dairy & Bakery",
            "category_id": 2,
            "category_image": "https://oneart.onrender.com/images/bakery1.JPG"
          },
          {
            "category_name": "Staples",
            "category_id": 3,
            "category_image": "https://oneart.onrender.com/images/staples.JPG"
          },
          {
            "category_name": "Stationaries",
            "category_id": 4,
            "category_image":
                "https://oneart.onrender.com/images/stationaries.JPG"
          },
          {
            "category_name": "Beverages",
            "category_id": 5,
            "category_image": "https://oneart.onrender.com/images/beverages.JPG"
          },
          {
            "category_name": "Personal Care",
            "category_id": 6,
            "category_image": "https://oneart.onrender.com/images/products.JPG"
          },
          {
            "category_name": "Home Care",
            "category_id": 7,
            "category_image": "https://oneart.onrender.com/images/home.JPG"
          },
          {
            "category_name": "Mom & Baby Care",
            "category_id": 8,
            "category_image": "https://oneart.onrender.com/images/baby.JPG"
          },
          {
            "category_name": "Home & Kitchen",
            "category_id": 9,
            "category_image": "https://oneart.onrender.com/images/kitchen.JPG"
          }
        ],
        "popular shops": [
          {
            "shop_id": 1,
            "shop_name": "Sai Chanduram Bakery",
            "shop_image": "image1.jpg"
          },
          {
            "shop_id": 2,
            "shop_name": "Nagpur Stores",
            "shop_image": "image2.jpg"
          },
          {
            "shop_id": 3,
            "shop_name": "Kirana King",
            "shop_image": "image3.jpg"
          },
          {"shop_id": 4, "shop_name": "Ajit Bakery", "shop_image": "image4.jpg"}
        ],
        "today's deals": [
          {
            "product_id": 73,
            "product_name": "Parachute Coconut Oil",
            "details": "Premium Coconut Oil",
            "variants": [
              {
                "variant_id": 6,
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
            ]
          },
          {
            "product_id": 74,
            "product_name": "Santoor Sandal & Turmeric Soap 150 g",
            "details": "premium bathing soap with haldi",
            "variants": [
              {
                "variant_id": 18,
                "variant_cost": 136.0,
                "count": 100,
                "brand_name": "Santoor",
                "discounted_cost": 124.0,
                "discount": 8,
                "quantity": "400 ml",
                "description":
                    "Showering and bathing is an everyday routine. Santoor Sandal & Turmeric Soap is required for you to begin your day on a refreshing note.",
                "image": [
                  "https://oneart.onrender.com/images/santoor-sandal-turmeric-soap-100.jpg"
                ],
                "ratings": 4
              }
            ]
          },
          {
            "product_id": 75,
            "product_name": "Pepsi 7up",
            "details": "Refreshing and tasty",
            "variants": [
              {
                "variant_id": 1,
                "variant_cost": 40.0,
                "count": 100,
                "brand_name": "Pepsi",
                "discounted_cost": 30.0,
                "discount": 25,
                "quantity": "750 ml",
                "description":
                    "Delight your guests with 7Up, it is the perfect drink for any weather.",
                "image": ["https://oneart.onrender.com/images/7up-750-ml.jpeg"],
                "ratings": 4
              }
            ]
          }
        ]
      }
    };
    return HomeModel.fromJson(response);
  }
}
