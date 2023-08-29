abstract class SelectVarientEvent {}

class GetAllVarients extends SelectVarientEvent {
  final int varId;

  GetAllVarients(this.varId);
}
