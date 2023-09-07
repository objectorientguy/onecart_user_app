abstract class GetProduct {}

class FetchProduct extends GetProduct {
  final int cateId;

  FetchProduct({required this.cateId});
}

class SortByPrice extends GetProduct{
  final bool sortPrice;
  SortByPrice({required this.sortPrice});
}