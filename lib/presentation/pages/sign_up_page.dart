
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_assistant/presentation/pages/sign_in_page.dart';
import 'package:medical_assistant/presentation/pages/tutorial_screen.dart';

import '../../constants/dimensions.dart';
import '../../constants/route_helper.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/outh_controller.dart';
import '../../data/models/sign_up_body.dart';
import '../nav_bar.dart';
import '../widgets/reusable_widgets/app_text_field.dart';
import '../widgets/reusable_widgets/custom_loader.dart';
import '../widgets/reusable_widgets/show_custom_snackBar.dart';
import '../widgets/sign_page_widgets/sing_up_button.dart';


class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedItem = 'User';
  @override
  Widget build(BuildContext context) {
    var lNameController = TextEditingController();
    var fNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var instController = TextEditingController();
    var workInstController = TextEditingController();


    void _registration() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String lName = lNameController.text.trim();
      String fName = fNameController.text.trim();
      String inst = instController.text.trim();
      String workInst = workInstController.text.trim();

      if(selectedItem != 'Medical Institution') {
        if (fName.isEmpty) {
          showCustomSnackBar(
              'Fill in  your a first name', title: 'First name');
        } else if (lName.isEmpty) {
          showCustomSnackBar(
              'Fill in  your last Name', title: 'Last name');
        } else if (email.isEmpty) {
          showCustomSnackBar(
              'Fill in  your email address', title: 'Email Address');
        } else if (!GetUtils.isEmail(email)) {
          showCustomSnackBar(
              'Fill in  a valid email address', title: 'Email Address');
        } else if (password.isEmpty) {
          showCustomSnackBar('Fill in  your password', title: 'Password');
        } else if (password.length < 6) {
          showCustomSnackBar(
              'Password must be six or more characters', title: 'Password');
        }
        else {
          SignUpBody signUpBody = SignUpBody(
              email: email,
              lName: lName,
              fName: fName,
              password: password,
              isUser:selectedItem == 'User' ?true:null,
            isDoctor:selectedItem == 'Doctor' ?true:null,
          );
          Get.find<AuthController>().registration(signUpBody).then((status) {
            if (status.isSucess) {
              Get.to(() => NavBar());
            } else {
              showCustomSnackBar(status.message);
            }
          });
        }
      }else{
        if (inst.isEmpty) {
          showCustomSnackBar(
              'Fill in  a the medical institution title', title: 'Medical institution');
        }else if (email.isEmpty) {
          showCustomSnackBar(
              'Fill in  your email address', title: 'Email Address');
        } else if (!GetUtils.isEmail(email)) {
          showCustomSnackBar(
              'Fill in  a valid email address', title: 'Email Address');
        } else if (password.isEmpty) {
          showCustomSnackBar('Fill in  your password', title: 'Password');
        } else if (password.length < 6) {
          showCustomSnackBar(
              'Password must be six or more characters', title: 'Password');
        }
        else {
          SignUpBody signUpBody = SignUpBody(
              email: email,
              hospitalInst: inst,
              password: password,
              isHospitalInst: true);
          Get.find<AuthController>().registration(signUpBody).then((status) {
            if (status.isSucess) {
              Get.to(() => NavBar());
            } else {
              showCustomSnackBar(status.message);
            }
          });
        }
      }

      }



    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
          builder: (authController) {
            return SafeArea(
              child: !authController.isLoading ? SingleChildScrollView(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:Dimensions.height10*2,),
                       Padding(
                         padding: EdgeInsets.only(left:Dimensions.width6),
                         child: RichText(
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
                       ),
                  SizedBox(height:selectedItem != 'Medical Institution'?Dimensions.height10*3:Dimensions.height10*6,),
                      Container(
                        height:Dimensions.height4*14,
                        width:double.infinity,
                        margin:EdgeInsets.only(bottom:0,left:Dimensions.width6,right:Dimensions.width6),
                        child: DropdownButtonFormField<String>(
                          value:selectedItem,
                          onChanged: (item){
                            setState((){
                            selectedItem=item!;
                            });
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText:'preferred user',
                              enabledBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color:Colors.lightBlue[200]!,
                                    width:1.5,
                                  )
                              ),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20),
                                  borderSide:BorderSide(
                                    color:Colors.lightBlue[200]!,
                                    width:1.4,
                                  )
                              )
                          ),
                          items:['User','Doctor','Medical Institution'].map((item){
                            return DropdownMenuItem<String>(
                                value:item,
                                child:Text(item));
                          }).toList(),
                        ),
                      ),
                      //email field
                      selectedItem != 'Medical Institution'?Column(
                        children: [
                          AppTextField(
                            icon:Icons.person,
                            text:'First name',
                            textController: fNameController,
                          ),
                          AppTextField(
                            icon:Icons.person,
                            text:'Last name',
                            textController: lNameController,
                          ),
                        ],
                      ):AppTextField(
                        icon:Icons.local_hospital_rounded,
                        text:"Medical institution",
                        textController: instController,
                      ),
                      AppTextField(icon: Icons.email,
                        text: 'Email',
                        textController: emailController,),
                      // password field
                      AppTextField(icon: Icons.password,
                          text: 'Password',
                          textController: passwordController,
                          isObscure: true),
                      SizedBox(height:selectedItem != 'Medical Institution'?Dimensions.height10*2:Dimensions.height10*10,),
                      //sign up
                      Padding(
                        padding:  EdgeInsets.only(left:Dimensions.width100),
                        child: GestureDetector(
                            onTap: () {
                              _registration();
                            },
                            child: SignUpButton(text: 'SIGN UP',)),
                      ),
                      SizedBox(height:Dimensions.height10*5),
                      Padding(
                        padding:EdgeInsets.only(left:Dimensions.width10*3),
                        child: RichText(
                          text:TextSpan(
                              text:'Already have an account? ',
                              style:TextStyle(
                                color:Colors.grey[500],
                                fontSize:20,
                              ),
                              children:[
                                TextSpan(
                                    recognizer:TapGestureRecognizer()..onTap=()=>Get.to(()=>SignIn()),
                                    text:'Sign In',
                                    style:TextStyle(
                                      color:Colors.grey[500],
                                      fontSize:20,
                                      fontWeight:FontWeight.bold,
                                    )
                                )
                              ]
                          ),
                        ),
                      )
                    ]
                ),
              ) : const CustomLoader(),
            );
          }
      ),
    );
  }
}
