
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medical_assistant/presentation/widgets/reusable_widgets/show_custom_snackBar.dart';

import '../presentation/nav_bar.dart';
import '../presentation/pages/sign_in_page.dart';
import '../presentation/pages/tutorial_screen.dart';

class OuthController extends GetxController{

  static OuthController instance = Get.find();

  late Rx<User?> _user;

  String? email;
  String? uid;


  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
    }else{
      email = user.email;
      uid = user.uid;
    }
  }

  void register(String email, String password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e.toString());
      showCustomSnackBar(title:'About User','Credentials Error');
    }
  }

  void login(String email, String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e.toString());
      showCustomSnackBar(title:'About User','Credentials error');
    }
  }
  void signOut(){
    auth.signOut();
  }
}