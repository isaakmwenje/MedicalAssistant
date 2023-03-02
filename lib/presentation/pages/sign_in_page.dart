import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_assistant/presentation/pages/sign_up_page.dart';
import 'package:medical_assistant/presentation/pages/tutorial_screen.dart';

import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/outh_controller.dart';
import '../nav_bar.dart';
import '../widgets/reusable_widgets/app_text_field.dart';
import '../widgets/reusable_widgets/custom_loader.dart';
import '../widgets/reusable_widgets/show_custom_snackBar.dart';
import '../widgets/sign_page_widgets/sing_up_button.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var emailController = TextEditingController();

    login(){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar('Fill in your email address',title: 'Email');
      }if(!email.isEmail){
        showCustomSnackBar('Fill in a valid email address',title: 'Email');
      }else if(password.isEmpty){
        showCustomSnackBar('Fill in your password',title:'Password');
      }else if(password.length<6){
        showCustomSnackBar('Password should be six characters or more',title:'Password');
      }else{
       Get.find<AuthController>().login(email,password).then((status){
        if(status.isSucess){
          Get.off(()=>const NavBar());
        }else {
          showCustomSnackBar(status.message);
        }
      });

      }
    }
    return Scaffold(
      backgroundColor:Colors.white,
      body:SafeArea(
          child:GetBuilder<AuthController>(
              builder: (authController) {
                return !authController.isLoading ?SingleChildScrollView(
                  child: Column(
                      children:[
                        SizedBox(height: Dimensions.height10*2,),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:Dimensions.height10*5),
                        Container(
                            margin:EdgeInsets.only(left:Dimensions.width6),
                            width:double.infinity,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Hello',
                                    style:TextStyle(
                                      color:Colors.blue,
                                      fontSize:80,
                                      fontWeight:FontWeight.bold,
                                    )
                                ),
                                Text(
                                    'log into your account',
                                    style:TextStyle(
                                      color:Colors.grey[500],
                                      fontSize:20,
                                    )
                                )
                              ],
                            )
                        ),
                        AppTextField(icon:Icons.email,text:'email',textController: emailController,),
                        AppTextField(icon:Icons.password,text:'Password',textController: passwordController,isObscure: true),
                        SizedBox(height: Dimensions.height40,),
                        GestureDetector(
                            onTap:(){
                              login();
                            },
                            child: SignUpButton(text: '  LOG IN  ',)),
                        SizedBox(height: Dimensions.height10*5),
                        RichText(
                          text:TextSpan(
                              text:'Don\'t have an account? ',
                              style:TextStyle(
                                color:Colors.grey[500],
                                fontSize:20,
                              ),
                              children:[
                                TextSpan(
                                    recognizer:TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUp()),
                                    text:'Create',
                                    style:TextStyle(
                                      color:Colors.grey[500],
                                      fontSize:20,
                                      fontWeight:FontWeight.bold,
                                    )
                                )
                              ]
                          ),
                        )
                      ]
                  ),
                ):const CustomLoader();
              }
          )
      ),
    );
  }
}