
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/uri_constants.dart';


class ApiClient extends GetConnect implements GetxService {
  SharedPreferences sharedPreferences;
late Map<String,String> _mainHeaders ;
late String token;
String appBaseUrl;
ApiClient({
  required this.appBaseUrl,required  this.sharedPreferences
}){
  token = sharedPreferences.getString(UriConstants.TOKEN)??'none';
  baseUrl = appBaseUrl;
  _mainHeaders = {
    'Content-type':'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
    'Connection':'Keep-Alive',
  };
}

  Future<Response> getData(String uri)async{
    return await get(uri,headers:_mainHeaders);
  }

  Future<Response>postData(String uri,dynamic body) async{
    return await post(uri,body,headers:_mainHeaders);
  }

  Future<Response> putData  (String uri,dynamic body) async  {
    return await put(uri,body,headers:_mainHeaders);
  }

  Future<Response> deleteData(String uri,dynamic body) async{
  return await delete(uri,headers:_mainHeaders);
  }

  void updateHeader(String token) {
  this.token = token;
  }

}