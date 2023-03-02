
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/uri_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../data/api_client.dart';
import '../../data/repository/auth_repository.dart';
 Future<void> init() async{

  //apiClient
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   Get.lazyPut(()=>sharedPreferences,fenix:true);
   Get.lazyPut(()=> ApiClient(appBaseUrl: UriConstants.APP_BASE_URL,sharedPreferences:Get.find()),fenix: true);

   //repository
   Get.lazyPut(()=>AuthRepository(apiClient: Get.find(),sharedPreferences: Get.find()),fenix: true);

   //controllers
   Get.lazyPut(()=>AuthController(authRepo: Get.find()),fenix:true);
 }