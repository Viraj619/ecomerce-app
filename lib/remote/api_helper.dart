import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/remote/exception_page.dart';
import 'package:http/http.dart'as httpClient;
class ApiHelper{

 Future<dynamic> getProduct({required String url})async{
  var res=await httpClient.post(Uri.parse(url));
  try{
   return returnResponse( res);
  }on SocketException catch (e){
   throw FetchException(Error: "No Internet !!");
  }
 }
 dynamic returnResponse(httpClient.Response response){
  switch(response.statusCode){
   case 200:
    var mData=jsonDecode(response.body);
    return mData;
   case 400:
    throw BedRequestException(Error:response.body.toString());
   case 401:
   case 403:
    throw UnauthorisedException(Error: response.body.toString());
   case 500:
    default:
     throw FetchException(Error: "Error Occurred while communicating with statusCode${response.statusCode.toString()}");
  }
 }
}