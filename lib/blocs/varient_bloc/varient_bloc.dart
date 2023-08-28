import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/varient_bloc/varient_events.dart';
import 'package:onecart_user_app/blocs/varient_bloc/varient_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/varient/select_varient_model.dart';
import '../../repositories/varient/varient_repository.dart';

class SelectVarientBloc extends Bloc<GetAllVarients, SelectVarientStates> {
  final SelectVarientRepository _selectVarientRepository =
      getIt<SelectVarientRepository>();

  SelectVarientStates get initialState => GetAllVarientsInitial();

  SelectVarientBloc() : super(GetAllVarientsInitial()) {
    on<GetAllVarients>(_getAllVarients);
  }

  FutureOr<void> _getAllVarients(
      GetAllVarients event, Emitter<SelectVarientStates> emit) async {
    emit(GetAllVarientsLoading());
    try {
      SelectVarientListModel selectVarientListModel =
          await _selectVarientRepository.getAllVarients(event.varId);
      log(selectVarientListModel.data.toString());

      emit(
          GetAllVarientsLoaded(selectVarientListModel: selectVarientListModel));
    } catch (e) {
      emit(GetAllVarientsError(message: e.toString()));
    }
  }
}
