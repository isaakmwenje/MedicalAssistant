
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_assistant/controllers/outh_controller.dart';
import 'package:medical_assistant/presentation/nav_bar.dart';
import 'package:medical_assistant/presentation/pages/sign_up_page.dart';
import 'package:medical_assistant/presentation/pages/tutorial_screen.dart';

import 'controllers/auth_controller.dart';
import 'firebase_options.dart';
import 'package:medical_assistant/utilities/dependecies/init_dependencies.dart' as dep;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value)=>Get.put(OuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home:  TutorialScreen(),
          // SignUp(),

    );

}
}
