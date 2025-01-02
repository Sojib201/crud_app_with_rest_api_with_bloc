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

class ProductCreated extends ProductCreateState {
  // final Map<String, String> formValues;
  // final bool isLoading;
  final String? errorMessage;

  ProductCreated(
    // required this.formValues,
    // this.isLoading = false,
    this.errorMessage,
  );

  @override
  List<Object?> get props => [errorMessage];
}


class DropDownLoadedState extends ProductCreateState {
  final List<String> dropdownlist;
  final String? selectedItem;

  DropDownLoadedState(this.dropdownlist, this.selectedItem);

  @override
  List<Object?> get props => [dropdownlist, selectedItem];
}