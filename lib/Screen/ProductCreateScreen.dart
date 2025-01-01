import 'package:crud_app_with_rest_api_with_bloc/bloc/productCreate/productCreate_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';
import '../bloc/productCreate/productCreate_event.dart';
import '../bloc/productCreate/productCreate_state.dart';
import 'ProductGridViewScreen.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  productCreateBloc bloc = productCreateBloc();
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    FormValues.update(MapKey, (value) => Textvalue);
  }

  // FormOnSubmit() async {
  //   if (FormValues['Img']!.length == 0) {
  //     ErrorToast('Image Link Required !');
  //   } else if (FormValues['ProductCode']!.length == 0) {
  //     ErrorToast('Product Code Required !');
  //   } else if (FormValues['ProductName']!.length == 0) {
  //     ErrorToast('Product Name Required !');
  //   } else if (FormValues['Qty']!.length == 0) {
  //     ErrorToast('Product Qty Required !');
  //   } else if (FormValues['TotalPrice']!.length == 0) {
  //     ErrorToast('Total Price Required !');
  //   } else if (FormValues['UnitPrice']!.length == 0) {
  //     ErrorToast('Unit Price Required !');
  //   } else {
  //     setState(
  //       () {
  //         Loading = true;
  //       },
  //     );
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : ((SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("ProductName", Textvalue);
                          },
                          decoration: AppInputDecoration('Product Name'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("ProductCode", Textvalue);
                          },
                          decoration: AppInputDecoration('Product Code'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("Img", Textvalue);
                          },
                          decoration: AppInputDecoration('Product Image'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("UnitPrice", Textvalue);
                          },
                          decoration: AppInputDecoration('Unit Price'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("TotalPrice", Textvalue);
                          },
                          decoration: AppInputDecoration('Total Price'),
                        ),
                        SizedBox(height: 20),
                        AppDropDownStyle(
                          DropdownButton(
                            value: FormValues['Qty'],
                            items: [
                              DropdownMenuItem(
                                child: Text('Select Qt'),
                                value: "",
                              ),
                              DropdownMenuItem(
                                child: Text('1 pcs'),
                                value: "1 pcs",
                              ),
                              DropdownMenuItem(
                                child: Text('2 pcs'),
                                value: '2 pcs',
                              ),
                              DropdownMenuItem(
                                child: Text('3 pcs'),
                                value: '3 pcs',
                              ),
                              DropdownMenuItem(
                                child: Text('4 pcs'),
                                value: '4 pcs',
                              ),
                            ],
                            onChanged: (Textvalue) {
                              InputOnChange("Qty", Textvalue);
                            },
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        BlocListener<productCreateBloc, ProductCreateState>(
                          listener: (context, state) {
                            if (state is ProductSubmittedState) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductGridViewScreen(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            child: ElevatedButton(
                              style: AppButtonStyle(),
                              onPressed: () {
                                //FormOnSubmit();
                                context.read<productCreateBloc>().add(
                                      SubmitForm(
                                        pName: FormValues['ProductName']
                                            .toString(),
                                        pCode: FormValues['ProductCode']
                                            .toString(),
                                        pImage: FormValues['Img'].toString(),
                                        pPrice:
                                            FormValues['UnitPrice'].toString(),
                                        pQty: FormValues['Qty'].toString(),
                                        pTotalPrice:
                                            FormValues['TotalPrice'].toString(),
                                      ),
                                    );
                              },
                              child: SuccessButtonChild('Submit'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          ),
        ],
      ),
    );
  }
}
