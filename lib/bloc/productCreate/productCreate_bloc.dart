import 'package:crud_app_with_rest_api_with_bloc/RestAPI/RestClient.dart';
import 'package:crud_app_with_rest_api_with_bloc/Style/Style.dart';
import 'package:crud_app_with_rest_api_with_bloc/bloc/productCreate/productCreate_event.dart';
import 'package:crud_app_with_rest_api_with_bloc/bloc/productCreate/productCreate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class productCreateBloc extends Bloc<ProductCreateEvent, ProductCreateState> {
  bool isSuccess = false;
  productCreateBloc() : super(ProductCreateInitial()) {
    on<SubmitForm>((event, emit) async {
      Map<String, String> FormValues = {
        "Img": event.pImage,
        "ProductCode": event.pCode,
        "ProductName": event.pName,
        "Qty": event.pQty,
        "TotalPrice": event.pPrice,
        "UnitPrice": event.pTotalPrice
      };


      FormOnSubmit() async {
        if (FormValues['Img']!.length == 0) {
          ErrorToast('Image Link Required !');
        } else if (FormValues['ProductCode']!.length == 0) {
          ErrorToast('Product Code Required !');
        } else if (FormValues['ProductName']!.length == 0) {
          ErrorToast('Product Name Required !');
        } else if (FormValues['Qty']!.length == 0) {
          ErrorToast('Product Qty Required !');
        } else if (FormValues['TotalPrice']!.length == 0) {
          ErrorToast('Total Price Required !');
        } else if (FormValues['UnitPrice']!.length == 0) {
          ErrorToast('Unit Price Required !');
        } else {


        }
      }

      isSuccess = await ProductCreateRequest(FormValues);
      print(isSuccess.toString());
      emit(ProductSubmittedState());
      emit(ProductCreated(formValues: {}));

    });
  }
}
