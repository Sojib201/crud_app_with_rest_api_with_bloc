import 'package:crud_app_with_rest_api_with_bloc/RestAPI/RestClient.dart';
import 'package:crud_app_with_rest_api_with_bloc/bloc/productCreate/productCreate_event.dart';
import 'package:crud_app_with_rest_api_with_bloc/bloc/productCreate/productCreate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class productCreateBloc extends Bloc<ProductCreateEvent, ProductCreateState> {
  final List<String> dropdownlist = ['1 pcs', '2 pcs', '3 pcs', '4 pcs'];
  String? selectedItem;

  productCreateBloc() : super(ProductCreateInitial()) {
    on<LoadDropDownLoadList>((event, emit) {
      emit(DropDownLoadedState(dropdownlist, null));
      //emit(DropDownLoadedState(dropdownlist, selectedItem));
    });
    on<DropdownItemSelected>((event, emit) {
      selectedItem = event.itemSelected;

      emit(DropDownLoadedState(dropdownlist, selectedItem));

    });

    on<SubmitForm>((event, emit) async {
      Map<String, String> formValues = {
        "ProductName": event.pName,
        "ProductCode": event.pCode,
        "Img": event.pImage,
        "UnitPrice": event.pPrice,
        "TotalPrice": event.pTotalPrice,
        "Qty": event.pQty
      };

      await ProductCreateRequest(formValues);

      emit(ProductSubmittedState());

    });

  }
}
