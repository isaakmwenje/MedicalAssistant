
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/uri_constants.dart';
import '../api_client.dart';
import 'package:get/get.dart';

import '../models/sign_up_body.dart';

class AuthRepository {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepository({required this.apiClient,required this.sharedPreferences});

  Future<Response> register(SignUpBody signUpBody) async{
    return await apiClient.postData(UriConstants.REGISTER_URI,signUpBody.toJson());
  }

  Future<Response> login(String email,String password)async{
    return await apiClient.postData(UriConstants.LOGIN_URI,{'email':email,'password':password});
  }

  Future<void> saveUserPasswordAndPhone(String phone ,String password)async{
    try {
      await sharedPreferences.setString(UriConstants.PHONE, phone);
      await sharedPreferences.setString(UriConstants.PASSWORD, password);
    }catch(e){
      print(e);
    }
  }


  Future<bool>saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeader(token);

    return await sharedPreferences.setString(UriConstants.TOKEN,token);
  }

  Future<bool> saveUser(bool farmer) async{
    return await sharedPreferences.setBool('IS_FARMER',farmer);
  }

  bool  getUser(){
    bool value = sharedPreferences.getBool('IS_FARMER')!;
    return value;
  }

  String getUserToken()  {
    //sharedPreferences.remove(AppConstants.TOKEN);
    return sharedPreferences.getString(UriConstants.TOKEN)?? 'None';
  }

  bool userLoggedIn(){
    sharedPreferences.remove(UriConstants.TOKEN);
    return sharedPreferences.containsKey(UriConstants.TOKEN);
  }

  bool clearSharedData(){
    sharedPreferences.remove('IS_FARMER');
    sharedPreferences.remove(UriConstants.TOKEN);
    sharedPreferences.remove(UriConstants.PASSWORD);
    sharedPreferences.remove(UriConstants.PHONE);
    apiClient.updateHeader('');
    apiClient.token = '';
    return true;
  }
}