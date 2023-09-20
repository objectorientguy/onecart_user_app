import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/categories_bloc/categories_events.dart';
import 'package:onecart_user_app/blocs/categories_bloc/categories_states.dart';
import 'package:onecart_user_app/repositories/categories/categories_repository.dart';

import '../../app_module/app_module.dart';
import '../../data/models/categories/get_all_categories_model.dart';

class GetAllCategoriesBloc extends Bloc<CategoriesEvent, CategoriesStates> {
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();

  CategoriesStates get initialState => GetAllCategoriesInitial();

  GetAllCategoriesBloc() : super(GetAllCategoriesInitial()) {
    on<GetAllCategories>(_getAllCategories);
  }

  FutureOr<void> _getAllCategories(
      CategoriesEvent event, Emitter<CategoriesStates> emit) async {
    emit(GetAllCategoriesLoading());
    try {
      GetAllCategoriesListModel getAllCategoriesListModel =
          await _categoriesRepository.getAllCategories();

      emit(GetAllCategoriesLoaded(
          getAllCategoriesListModel: getAllCategoriesListModel));
    } catch (e) {
      emit(GetAllCategoriesError(message: e.toString()));
    }
  }
}
