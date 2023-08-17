import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {}

class FetchAddress extends AddressEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
