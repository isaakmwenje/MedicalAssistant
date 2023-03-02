

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medical_assistant/presentation/pages/sign_in_page.dart';

import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../nav_bar.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
       title: "WELCOME",
       body: "MedicalAssistant mobile app provides real time attention to users."
           "Monitor your health at the comfort of your home",
      image:Stack(
        children: [
          Image(
            image:AssetImage('assets/welcome.jpg'),
          ),
          Positioned(
            bottom:0,
            left:0,
            right:0,
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color:Colors.blue,
                      shape: BoxShape.circle),
                  child: Padding(
                    //this padding will be you border size
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage:AssetImage('assets/stethoscope.png'),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text:const TextSpan(
                      text:'Medical',
                      style:TextStyle(
                        color:Colors.blue,
                        fontSize:28,
                        fontWeight:FontWeight.bold,
                      ),
                      children:[
                        TextSpan(
                            text:'assistant',
                            style:TextStyle(
                              color:Colors.blueGrey,
                              fontSize:28,
                              fontWeight:FontWeight.bold,
                            )
                        )
                      ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // footer: ElevatedButton(
      //   onPressed: () {
      //     // On button presed
      //   },
      //   child: const Text("Let's Go !"),
      // ),
    ),
    PageViewModel(
      title: "Explore nearby pharmacies",
      body: "Navigate to home screen and explore pharmacies located few miles from your point of being",
      image:Column(
        children:[
          SizedBox(height:Dimensions.height10*2),
          const  Image(
          image:AssetImage('assets/maps.png'),
          ),
        ],
      ),
    ),
    PageViewModel(
      title: "Book a doctor's appointment",
      body: "Navigate to myhealth page and book your first appointment with a qualified professional medical expert",
      image:const Image(
        image:AssetImage('assets/appointment.png'),
      ),
      footer: ElevatedButton(
        onPressed: () {
          Get.off(()=>!Get.find<AuthController>().userLoggedIn()? NavBar(): SignIn()
          );
        },
        child: const Text("Get started"),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Get.find<AuthController>().userLoggedIn();
    return Scaffold(
      body:SafeArea(
        child:IntroductionScreen(
          pages: listPagesViewModel,
          onDone: () {
            Get.off(()=>isLoggedIn? NavBar(): SignIn());
          },
          onSkip: () {
            Get.off(()=>isLoggedIn? NavBar(): SignIn());
          },
          showBackButton: false,
          showSkipButton: true,
          skip: const Text('skip', style: TextStyle(letterSpacing:1.2,fontWeight: FontWeight.w600)),
          next: const Icon(Icons.navigate_next),
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.blue,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        )
      )
    );
  }
}
