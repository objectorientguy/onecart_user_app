import 'package:equatable/equatable.dart';

import '../../data/models/categories/get_all_categories_model.dart';

abstract class CategoriesStates extends Equatable {}

class GetAllCategoriesInitial extends CategoriesStates {
  @override
  List<Object?> get props => [];
}

class GetAllCategoriesLoading extends CategoriesStates {
  @override
  List<Object?> get props => [];
}

class GetAllCategoriesLoaded extends CategoriesStates {
  final GetAllCategoriesListModel getAllCategoriesListModel;

  GetAllCategoriesLoaded({required this.getAllCategoriesListModel});

  @override
  List<Object?> get props => [];
}

class GetAllCategoriesError extends CategoriesStates {
  final String message;

  GetAllCategoriesError({required this.message});

  @override
  List<Object?> get props => [];
}
