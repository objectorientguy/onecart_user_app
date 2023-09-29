import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/ratings_bloc/ratings_events.dart';
import 'package:onecart_user_app/blocs/ratings_bloc/ratings_states.dart';
import '../../app_module/app_module.dart';
import '../../data/models/ratings_model/add_ratings_model.dart';
import '../../data/models/ratings_model/view_ratings_model.dart';
import '../../repositories/ratings/ratings_repository.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsStates> {
  final ViewRatingsRepository _ratingsRepository =
      getIt<ViewRatingsRepository>();

  RatingsStates get initialState => GetAllRatingsInitial();

  RatingsBloc() : super(GetAllRatingsInitial()) {
    on<GetAllRatings>(_getAllRatings);
    on<AddRatings>(_addRatings);
  }

  FutureOr<void> _getAllRatings(
      GetAllRatings event, Emitter<RatingsStates> emit) async {
    emit(GetAllRatingsLoading());
    try {
      ViewRatingsModel viewRatingsModel =
          await _ratingsRepository.getAllRatings(event.productId);

      emit(GetAllRatingsLoaded(viewRatingsModel: viewRatingsModel));
    } catch (e) {
      emit(GetAllRatingsError(message: e.toString()));
    }
  }

  FutureOr<void> _addRatings(
      AddRatings event, Emitter<RatingsStates> emit) async {
    emit(AddRatingsLoading());
    try {
      Map reviewTextMap = {
        "rating": event.reviewMap["rating"],
        "review_text": event.reviewMap["review_text"],
      };
      AddRatingsModel addRatingsModel =
          await _ratingsRepository.addRatings(reviewTextMap, 1, 9898989898);

      if (addRatingsModel.status == '200') {
        emit(AddRatingsLoaded(
          addRatingsModel: addRatingsModel,
          reviewTextMap: reviewTextMap,
        ));
      } else {
        emit(AddRatingsError(message: addRatingsModel.message));
      }
    } catch (e) {
      emit(AddRatingsError(message: e.toString()));
    }
  }
}
