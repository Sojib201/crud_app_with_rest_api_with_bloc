import 'package:equatable/equatable.dart';

abstract class ProductCreateEvent extends Equatable {}

class InputChanged extends ProductCreateEvent {
  final String key;
  final String value;

  InputChanged(this.key, this.value);

  @override
  List<Object?> get props => [key, value];
}

class SubmitForm extends ProductCreateEvent {
  final String pName, pCode, pImage, pPrice, pTotalPrice, pQty;

  SubmitForm(
      {required this.pName,
      required this.pCode,
      required this.pImage,
      required this.pPrice,
      required this.pTotalPrice,
      required this.pQty});

  @override
  // TODO: implement props
  List<Object?> get props => [pName, pCode, pImage, pPrice, pTotalPrice, pQty];
}
