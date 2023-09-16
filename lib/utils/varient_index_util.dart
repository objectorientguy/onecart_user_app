import '../data/models/general_data_model/general_category_data.dart';

class VariantIndexUtil {
  int getVariantIndex(Product product) {
    int variantIndex = 0;
    for (var item in product.variants) {
      if (item.count == 0) {
        variantIndex++;
      } else {
        return variantIndex;
      }
    }
    return 0;
  }
}
