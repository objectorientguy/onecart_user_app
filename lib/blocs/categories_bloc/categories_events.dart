import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {}

class GetAllCategories extends CategoriesEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
