abstract class SearchProductEvent {}

class SearchAllProducts extends SearchProductEvent {
  final String searchTerm;

  SearchAllProducts({required this.searchTerm});
}
