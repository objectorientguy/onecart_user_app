import 'package:onecart_user_app/repositories/product_list/product_list_repository.dart';

import '../../data/models/get_product/get_product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<GetProductByIdModel> fetchProducts() async {
    return GetProductByIdModel.fromJson({
      "status": 200,
      "message": "Product by category Fetched",
      "data": [
        {
          "company_name": "park avenue",
          "category_id": 3,
          "product_name": "perfume",
          "image": ["parkavenue.jpg"],
          "cost": "200",
          "details": "This is a chocolate product with some details.",
          "company_id": 2,
          "product_id": 8,
          "item_count": 900,
          "discounted_cost": "20.0"
        },
        {
          "company_name": "park avenue",
          "category_id": 3,
          "product_name": "perfume",
          "image": ["parkavenue.jpg"],
          "cost": "200",
          "details": "This is a perfume product with some details.",
          "company_id": 2,
          "product_id": 8,
          "item_count": 900,
          "discounted_cost": "20.0"
        },
        {
          "company_name": "park avenue",
          "category_id": 3,
          "product_name": "perfume",
          "image": ["parkavenue.jpg"],
          "cost": "200",
          "details": "This is a perfume product with some details.",
          "company_id": 2,
          "product_id": 8,
          "item_count": 560,
          "discounted_cost": "20.0"
        },
        {
          "company_name": "park avenue",
          "category_id": 3,
          "product_name": "perfume",
          "image": ["parkavenue.jpg"],
          "cost": "200",
          "details": "This is a perfume product with some details.",
          "company_id": 2,
          "product_id": 8,
          "item_count": 900,
          "discounted_cost": "20.0"
        },
      ]
    });
  }
}
