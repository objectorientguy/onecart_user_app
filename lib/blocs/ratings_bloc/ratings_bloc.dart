import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/ratings_bloc/ratings_events.dart';
import 'package:onecart_user_app/blocs/ratings_bloc/ratings_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/ratings_model/view_ratings_model.dart';
import '../../repositories/ratings/ratings_repository.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsStates> {
  final ViewRatingsRepository _viewRatingsRepository =
      getIt<ViewRatingsRepository>();

  RatingsStates get initialState => GetAllRatingsInitial();

  RatingsBloc() : super(GetAllRatingsInitial()) {
    on<GetAllRatings>(_getAllRatings);
  }

  FutureOr<void> _getAllRatings(
      GetAllRatings event, Emitter<RatingsStates> emit) async {
    emit(GetAllRatingsLoading());
    try {
      ViewRatingsModel viewRatingsModel =
          await _viewRatingsRepository.getAllRatings();

      emit(GetAllRatingsLoaded(viewRatingsModel: viewRatingsModel));
    } catch (e) {
      emit(GetAllRatingsError(message: e.toString()));
    }
  }
}
