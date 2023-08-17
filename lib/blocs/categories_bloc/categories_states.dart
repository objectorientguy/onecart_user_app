import '../../data/models/categories/get_all_categories_model.dart';

abstract class CategoriesStates {}

class GetAllCategoriesInitial extends CategoriesStates {}

class GetAllCategoriesLoading extends CategoriesStates {}

class GetAllCategoriesLoaded extends CategoriesStates {
  final GetAllCategoriesListModel getAllCategoriesListModel;

  GetAllCategoriesLoaded({required this.getAllCategoriesListModel});
}

class GetAllCategoriesError extends CategoriesStates {
  final String message;

  GetAllCategoriesError({required this.message});
}
