import 'package:equatable/equatable.dart';

abstract class ProductCreateEvent extends Equatable {}

class LoadDropDownLoadList extends ProductCreateEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DropdownItemSelected extends ProductCreateEvent {
  String itemSelected;
  DropdownItemSelected(this.itemSelected);

  @override
  // TODO: implement props
  List<Object?> get props => [itemSelected];
}

class SubmitForm extends ProductCreateEvent {
  final String pName;
  final String pCode;
  final String pImage;
  final String pPrice;
  final String pQty;
  final String pTotalPrice;

  SubmitForm({
    required this.pName,
    required this.pCode,
    required this.pImage,
    required this.pPrice,
    required this.pQty,
    required this.pTotalPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [pName, pCode, pImage, pPrice, pTotalPrice, pQty];
}
