import 'package:onecart_user_app/repositories/varient/varient_repository.dart';

import '../../data/models/varient/select_varient_model.dart';
import '../../utils/dio_client.dart';

class SelectVarientRepositoryImpl implements SelectVarientRepository {
  @override
  Future<SelectVarientListModel> getAllVarients(int variantId) async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getProductVariants/$variantId");
    return SelectVarientListModel.fromJson(response);
  }
}
