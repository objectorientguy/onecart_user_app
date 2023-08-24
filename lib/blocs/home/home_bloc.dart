import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_module/app_module.dart';
import '../../data/models/home/home_model.dart';
import '../../repositories/home/home_repository.dart';
import 'home_events.dart';
import 'home_states.dart';

class GetHomeDetailsBloc extends Bloc<GetHomeDetails, HomeStates> {
  final HomeRepository _homeRepository = getIt<HomeRepository>();

  HomeStates get initialState => GetHomeDetailsInitial();

  GetHomeDetailsBloc() : super(GetHomeDetailsInitial()) {
    on<GetHomeDetails>(_getHomeDetails);
  }

  FutureOr<void> _getHomeDetails(
      GetHomeDetails event, Emitter<HomeStates> emit) async {
    emit(GetHomeDetailsLoading());
    // try {
    log('key');
    HomeModel homeModel = await _homeRepository.getHomeDetails();
    log('yek');
    emit(GetHomeDetailsLoaded(homeModel: homeModel));
    // } catch (e) {
    //   log(e.toString());
    //   emit(GetHomeDetailsError(message: e.toString()));
    // }
  }
}
