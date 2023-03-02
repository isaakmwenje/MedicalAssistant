import 'package:get/get.dart';

import '../presentation/nav_bar.dart';
import '../presentation/pages/sign_in_page.dart';
import '../presentation/pages/tutorial_screen.dart';

class RouteHelper {

  static const String tutorialScreen = '/tutorial-screen';
  static const String initial = '/';
  static const String signIn = '/sign-in';

  static getSplashScreen() => tutorialScreen;
  static getInitialScreen()=> initial;
  static getSignInPage()=>signIn;
  static List<GetPage> pages = [
    GetPage(
      name:tutorialScreen,page:()=>const TutorialScreen()
    ),
    GetPage(
      name:initial,page:()=>const NavBar(),
    ),
    GetPage(
      name:signIn,page:()=>  SignIn(),transition:Transition.fadeIn
    )
  ];

}