import '../../data/models/varient/select_varient_model.dart';

abstract class SelectVarientStates {}

class GetAllVarientsInitial extends SelectVarientStates {}

class GetAllVarientsLoading extends SelectVarientStates {}

class GetAllVarientsLoaded extends SelectVarientStates {
  final SelectVarientListModel selectVarientListModel;

  GetAllVarientsLoaded({required this.selectVarientListModel});
}

class GetAllVarientsError extends SelectVarientStates {
  final String message;

  GetAllVarientsError({required this.message});
}
