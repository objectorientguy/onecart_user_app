import '../../data/models/varient/select_varient_model.dart';

abstract class SelectVarientRepository {
  Future<SelectVarientListModel> getAllVarients(int variantId);
}
