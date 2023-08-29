abstract class GetProduct {}

class FetchProduct extends GetProduct {
  final int cateId;

  FetchProduct({required this.cateId});
}
