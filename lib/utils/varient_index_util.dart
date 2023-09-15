import '../data/models/general_data_model/general_category_data.dart';

class VarientIndexUtil {
  int getVarientIndex(Product product) {
    int varientIndex = 0;
    for (var item in product.variants) {
      if (item.count == 0) {
        varientIndex++;
      } else {
        return varientIndex;
      }
    }
    return 0;
  }
}
