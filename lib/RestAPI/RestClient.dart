import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Style/Style.dart';

Future<bool> ProductCreateRequest(Formvalues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(Formvalues);
  var PostHeader = {"Content-Type": "application/json"};
  var Response = await http.post(URL, headers: PostHeader, body: PostBody);
  var ResultCode = Response.statusCode;
  var ResultBody = json.decode(Response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request failed ! Try again");
    return false;
  }
}

Future<bool> ProductUpdateRequest(Formvalues, id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/" + id);
  var PostBody = json.encode(Formvalues);
  var PostHeader = {"Content-Type": "application/json"};
  var Response = await http.post(URL, headers: PostHeader, body: PostBody);
  var ResultCode = Response.statusCode;
  var ResultBody = json.decode(Response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request failed ! Try again");
    return false;
  }
}

Future<List> ProductGridViewList() async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader = {"Content-Type": "application/json"};
  var Response = await http.get(URL, headers: PostHeader);

  var ResultCode = Response.statusCode;
  var ResultBody = json.decode(Response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return ResultBody['data'];
  } else {
    ErrorToast("Request Failed! Try Again");
    return [];
  }
}

Future<bool> ProductDeleteRequest(id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/" + id);
  var PostHeader = {"Content-Type": "application/json"};
  var Response = await http.get(URL, headers: PostHeader);

  var ResultCode = Response.statusCode;
  var ResultBody = json.decode(Response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request Failed! Try Again");
    return false;
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../Style/Style.dart';
//
// Future<List> ProductGridViewListRequest() async {
//   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
//   var PostHeader = {"Content-Type": "application/json"};
//   var response = await http.get(URL, headers: PostHeader);
//
//   var ResultCode = response.statusCode;
//
//   // Check if the response body is valid JSON
//   var ResultBody;
//   try {
//     ResultBody = json.decode(response.body);
//   } catch (e) {
//     print("Error decoding JSON: $e");
//     ErrorToast("Invalid response format");
//     return [];
//   }
//
//   if (ResultCode == 200 && ResultBody['status'] == "success") {
//     SuccessToast("Request Success");
//     return ResultBody['data'];
//   } else {
//     ErrorToast("Request failed! Try again.");
//     return [];
//   }
// }
//
// Future<bool> ProductCreateRequest(FormValues) async {
//   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
//   var PostBody = json.encode(FormValues);
//   var PostHeader = {"Content-Type": "application/json"};
//   var response = await http.post(URL, headers: PostHeader, body: PostBody);
//
//   var ResultCode = response.statusCode;
//
//   // Check if the response body is valid JSON
//   var ResultBody;
//   try {
//     ResultBody = json.decode(response.body);
//   } catch (e) {
//     print("Error decoding JSON: $e");
//     ErrorToast("Invalid response format");
//     return false;
//   }
//
//   if (ResultCode == 200 && ResultBody['status'] == "success") {
//     SuccessToast("Request Success");
//     return true;
//   } else {
//     ErrorToast("Request failed! Try again.");
//     return false;
//   }
// }
//
// Future<bool> ProductDeleteRequest(id) async {
//   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
//   var PostHeader = {"Content-Type": "application/json"};
//   var response = await http.get(URL, headers: PostHeader);
//
//   var ResultCode = response.statusCode;
//
//   // Check if the response body is valid JSON
//   var ResultBody;
//   try {
//     ResultBody = json.decode(response.body);
//   } catch (e) {
//     print("Error decoding JSON: $e");
//     ErrorToast("Invalid response format");
//     return false;
//   }
//
//   if (ResultCode == 200 && ResultBody['status'] == "success") {
//     SuccessToast("Request Success");
//     return true;
//   } else {
//     ErrorToast("Request failed! Try again.");
//     return false;
//   }
// }
//
// Future<bool> ProductUpdateRequest(FormValues, id) async {
//   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
//   var PostBody = json.encode(FormValues);
//   var PostHeader = {"Content-Type": "application/json"};
//   var response = await http.post(URL, headers: PostHeader, body: PostBody);
//
//   var ResultCode = response.statusCode;
//
//   // Check if the response body is valid JSON
//   var ResultBody;
//   try {
//     ResultBody = json.decode(response.body);
//   } catch (e) {
//     print("Error decoding JSON: $e");
//     ErrorToast("Invalid response format");
//     return false;
//   }
//
//   if (ResultCode == 200 && ResultBody['status'] == "success") {
//     SuccessToast("Request Success");
//     return true;
//   } else {
//     ErrorToast("Request failed! Try again.");
//     return false;
//   }
// }
