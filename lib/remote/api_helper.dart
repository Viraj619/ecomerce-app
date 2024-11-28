import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/remote/exception_page.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:http/http.dart'as httpClient;
import 'package:shared_preferences/shared_preferences.dart';
class ApiHelper{

 /// get api
 Future<dynamic> getAPI({required String url,})async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  String uid=pref.getString(Names.UID_KEY)??" ";
  var res=await httpClient.get(Uri.parse(url),headers:{
   "Authorization":"Bearer $uid"
  });
  try{
   return returnResponse( res);
  }on SocketException catch (e){
   throw FetchException(mError: ' "No Internet !!"');
  }
 }

 /// post api
 Future<dynamic>postAPI({required String url,bool isRequiredHeader=true,
 Map<String,dynamic>?mBodyParams})async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  String uid=  pref.getString(Names.UID_KEY)??" ";
  var resPost=await httpClient.post(Uri.parse(url),
      headers: isRequiredHeader?{
   "Authorization":"Bearer $uid"
      }:null,
      body: mBodyParams!=null?jsonEncode(mBodyParams):null);
  try{
   return returnResponse(resPost);
  }on SocketException catch(e){
   FetchException(mError: "No Internet");
  }
 }

 /// return response
 dynamic returnResponse(httpClient.Response response){
  switch(response.statusCode){
   case 200:
    var mData=jsonDecode(response.body);
    return mData;
   case 400:
    throw BedRequestException(mError:response.body.toString(),);
   case 401:
   case 403:
    throw UnauthorisedException(mError: response.body.toString());
   case 500:
    default:
     throw FetchException(mError: "Error Occurred while communicating with statusCode${response.statusCode.toString()}");
  }
 }
}