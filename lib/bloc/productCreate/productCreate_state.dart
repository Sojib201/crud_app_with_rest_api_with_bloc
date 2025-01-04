import 'package:equatable/equatable.dart';

abstract class ProductCreateState extends Equatable {}

class ProductCreateInitial extends ProductCreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductSubmittedState extends ProductCreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class DropDownLoadedState extends ProductCreateState {
  final List<String> dropdownlist;
  final String? selectedItem;

  DropDownLoadedState(this.dropdownlist, this.selectedItem);

  @override
  List<Object?> get props => [dropdownlist, selectedItem];
}

