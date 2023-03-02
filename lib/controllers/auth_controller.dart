import 'package:get/get.dart';

import '../data/models/response_model.dart';
import '../data/models/sign_up_body.dart';
import '../data/repository/auth_repository.dart';


class AuthController extends GetxController implements GetxService{
  AuthRepository authRepo;
  AuthController({required this.authRepo});

  late bool _isFarmer;
  bool get isFarmer => _isFarmer;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel>registration(SignUpBody signUpBody) async{
    _isLoading = true;
    update();
    Response response = await  authRepo.register(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      //debugPrint(response.body.toString());
      //print(response.body.toString());
      await authRepo.saveUser(response.body['farmer']);
      await authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true,response.body['token']);
    }else{
      //print('status'+response.statusCode.toString());
      print('statusText'+response.body.toString());
      responseModel = ResponseModel(false,response.statusText!);
    }

    _isLoading = false;
    update();

    return  responseModel;
  }

  Future<ResponseModel> login(String email, String password)async{
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.login(email,password);
    if(response.statusCode == 200){
      print(response.body);
      //print('login isFarmer  '+response.body['farmer']);
      // await authRepo.saveUser(response.body['farmer']);
      await authRepo.saveUser(response.body['farmer']);
      await authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true,response.body['token']);
    }else{
      responseModel = ResponseModel(false,response.statusText!);
      print('status'+response.statusCode.toString());
      print('statusText'+response.body.toString());
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  saveUserPasswordAndPhone(String phone,String password){
    authRepo.saveUserPasswordAndPhone(phone, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool getUser(){
    return authRepo.getUser();
  }

  bool clearSharedData(){
    return  authRepo.clearSharedData();
  }



}
